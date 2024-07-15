import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class Message {
  final String senderID;
  final String senderEmail;
  final String receiverID;
  final String message;
  final Timestamp timestamp;
  final bool isRead;
  Message ({
    required this.senderID,
    required this.senderEmail,
    required this.receiverID,
    required this.message,
    required this.timestamp,
    this.isRead = false,
  });

  Map<String,dynamic> toMap(){
    return {
     'senderID': senderID,
     'senderEmail': senderEmail,
     'receiverID': receiverID,
     'message': message,
      'timestamp': timestamp,
      'isRead': isRead
    };
  }

  static Message fromMap(Map<String, dynamic> map){
    return Message(
      senderID: map['senderID'],
      senderEmail: map['senderEmail'],
      receiverID: map['receiverID'],
      message: map['message'],
      timestamp: map['timestamp'],
      isRead: map['isRead'] ?? false,
    );
  }


}

class Users{
  String uid;
  String email;
  bool hasUnreadMessage;

  Users({
    required this.uid,
    required this.email,
    this.hasUnreadMessage = false,
  });

  Map<String, dynamic> toMap(){
    return {
      'uid': uid,
      'email': email,
      'hasUnreadMessage': hasUnreadMessage
    };
  }
  static Users fromMap(Map<String, dynamic> map){
    return Users(
      uid: map['uid'],
      email: map['email'],
      hasUnreadMessage: map['hasUnreadMessage']?? false,
    );
  }
}