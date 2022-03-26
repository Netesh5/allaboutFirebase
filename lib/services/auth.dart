import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseapp/model/user.dart';
import 'package:firebaseapp/services/database.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
  Future register_with_email_password(
      String email, String password, BuildContext context) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      await DatabaseService(uid: user!.uid)
          .updateUserData("Drink water", "Drink 1 litre water", "3:00");
      return _userfromFirebaseuser(user);
    } catch (e) {
      showsnackbar(context, e.toString());
      return null;
    }
  }

//Sign in with email-password
  Future sign_in_with_email_password(
      String email, String password, BuildContext context) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userfromFirebaseuser(user!);
    } catch (e) {
      showsnackbar(context, e.toString());
    }
  }

  //Sign in with google
  Future sign_in_with_google() async {
    final GoogleSignIn _googleSignin = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    ); //Instance of googel signin
    try {
      GoogleSignInAccount? googleSignInAccount =
          await _googleSignin.signIn(); //to generate popup of gmail accounts
      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken);

        try {
          UserCredential result = await _auth.signInWithCredential(credential);
          await DatabaseService(uid: result.user!.uid)
              .updateUserData("Drink water", "Drink 1 litre water", "3:00");
        } catch (e) {
          debugPrint(e.toString());
        }
      } else {
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  //signin with mobile
  Future verify_phone_number(
      BuildContext context, String phoneNumber, Function setdata) async {
    //Handlers
    // ignore: prefer_function_declarations_over_variables
    PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential phoneAuthCredential) async {
      showsnackbar(context, "Verification completed");
    };
    // ignore: prefer_function_declarations_over_variables
    PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException exception) {
      showsnackbar(context, exception.toString());
    };
    // ignore: prefer_function_declarations_over_variables
    PhoneCodeSent codeSent =
        (String? verificationId, [int? forceResendingtoken]) {
      showsnackbar(context, "code sent to provide number");
      setdata(verificationId);
    };

    // ignore: prefer_function_declarations_over_variables
    PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String? verificationId) {
      showsnackbar(context, "Time out");
    };
    try {
      var result = await _auth.verifyPhoneNumber(
          timeout: const Duration(seconds: 60),
          phoneNumber: phoneNumber,
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
      debugPrint(phoneNumber);
    } catch (e) {
      showsnackbar(context, e.toString());
    }
  }

  Future sign_with_phoneNumber(
      String verificationId, String smsCode, BuildContext context) async {
    try {
      AuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      showsnackbar(context, "Signed in sucessfully");
    } catch (e) {
      showsnackbar(context, e.toString());
    }
  }

  void showsnackbar(BuildContext context, String text) {
    final snackBar = SnackBar(
      content: Text(
        text,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
