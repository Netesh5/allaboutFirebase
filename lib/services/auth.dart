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

//Register in with email-password
  Future register_with_email_password(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userfromFirebaseuser(user!);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

//Sign in with email-password
  Future sign_in_with_email_password(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userfromFirebaseuser(user!);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
