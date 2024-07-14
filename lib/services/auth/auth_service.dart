import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;//auth users
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;//database(chat)

  User? getCurrentUser(){
    return _auth.currentUser;
  }

  Future<UserCredential> signInWithEmailAndPassword(String email, String password) async {
    try{
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email, password: password
      );
      _firestore.collection('Users').doc(userCredential.user!.uid).set(
        {
          'uid': userCredential.user!.uid,
          'email': email,
        },
        SetOptions(merge: true),
      );
      return userCredential;
    }on FirebaseException catch(e){
      throw Exception(e.code);
    }


  }
  Future<UserCredential> signUpWithEmailAndPassword(String email, String password) async {
    try{
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password
      );
      _firestore.collection('Users').doc(userCredential.user!.uid).set(
        {
          'uid': userCredential.user!.uid,
          'email': email,
        },
        SetOptions(merge: true),
      );
      return userCredential;
    }on FirebaseException catch(e){
      throw Exception(e.code);
    }
  }
  Future<void> sighOut() async {
    return await _auth.signOut();
  }

  String getErrorMessage(String errorCode){
    switch(errorCode){
      case 'ERROR_INVALID_EMAIL':
        return 'Email is invalid';
      case 'ERROR_WRONG_PASSWORD':
        return 'Password is invalid';
      case 'ERROR_USER_NOT_FOUND':
        return 'User not found';
      case 'ERROR_OPERATION_NOT_ALLOWED':
        return 'Operation not allowed';
      case 'ERROR_TOO_MANY_REQUESTS':
        return 'Too many requests';
      case 'ERROR_WEAK_PASSWORD':
        return 'Password is too weak';
      case 'ERROR_INVALID_PASSWORD':
        return 'Password is invalid';
      case 'ERROR_WEAK_PASSWORD':
        return 'Password is too weak';
      case 'ERROR_INVALID_EMAIL':
        return 'Email is invalid';
      case 'ERROR_INVALID_USER':
        return 'User is invalid';
      case 'ERROR_USER_DISABLED':
        return 'User is disabled';
      default:
        return errorCode;
    }
  }
}