import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseOptions{
  static FirebaseOptions get currentPlatform{
    return android;
  }
  static  const  FirebaseOptions android = FirebaseOptions(
      apiKey: "AIzaSyCEaHRG3dwzxVCCjiVs_avx7uq7MqcAM4k",
      appId: "1:715542234920:android:d03acef295ec58ed7b321d",
      messagingSenderId: "715542234920",
      projectId: "goodchat-598d6",
      storageBucket: "goodchat-598d6.appspot.com",
    );
}