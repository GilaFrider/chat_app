// import 'package:chat/models/message.dart';
// import 'package:chat_app/model/message.dart';
import 'package:chat_app/model/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatService extends ChangeNotifier {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  Future<void> sendMessage(String receiverID, String message) async {
    final currentUser = _auth.currentUser!;
    final newMessage = Message(
      senderID: currentUser.uid,
      senderEmail: currentUser.email!,
      receiverID: receiverID,
      message: message,
      timestamp: Timestamp.now(),
    );
    final chatRoomId = [currentUser.uid, receiverID]..sort();
    await _firestore
        .collection('chats')
        .doc(chatRoomId.join('-'))
        .collection('messages')
        .add(newMessage.toMap());
    await _firestore
        .collection("Users")
        .doc(currentUser.uid)
        .update({"hasUnreadMessages": true});
  }

  Stream<List<Users>> getUsersStream() {
    return _firestore.collection('Users').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Users.fromMap(doc.data())).toList());
    //  .listen((event) => notifyListeners(event));
  }

  Future<void> markMessageAsRead(String receiverID, String senderID) async {
    final chatRoomId = [receiverID, senderID]..sort();
    final messageSnapShot = await _firestore
        .collection('chat_room')
        .doc(chatRoomId.join('_'))
        .collection("messages")
        .where('isRead', isEqualTo: false)
        .get();

    for (var doc in messageSnapShot.docs) {
      await doc.reference.update({'isRead': true});
    }

    await _firestore
        .collection("Users")
        .doc(senderID)
        .update({"hasUnreadMessages": false});
  }

  Stream<QuerySnapshot> getMessage(String userID, String otherUserID) {
    final chatRoomId = [userID, otherUserID]..sort();
    return _firestore
        .collection('chats')
        .doc(chatRoomId.join('-'))
        .collection('messages')
        .orderBy('timestamp', descending: true)
        .limit(10)
        .snapshots();
  }
}
