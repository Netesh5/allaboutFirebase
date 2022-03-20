import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthServices {
//sign in anonoymus

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future siginAnono() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return user;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

//sign in with email-password

}
