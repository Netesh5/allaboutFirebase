import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseapp/model/user.dart';
import 'package:flutter/material.dart';

class AuthServices {
//sign in anonoymus

  final FirebaseAuth _auth = FirebaseAuth.instance;

  users? _userfromFirebaseuser(User user) {
    return user != null ? users(uid: user.uid) : null;
  }

  Future siginAnono() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userfromFirebaseuser(user!);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Stream<users?> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _userfromFirebaseuser(user!));
  }

  Future signout() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

//sign in with email-password

}
