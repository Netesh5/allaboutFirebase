// ignore_for_file: deprecated_member_use

import 'package:firebaseapp/services/auth.dart';
import 'package:flutter/material.dart';

class signin extends StatefulWidget {
  @override
  State<signin> createState() => siginState();
}

class siginState extends State<signin> {
  AuthServices _auth = AuthServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text(
            "Sign in Anonomusly",
            style: TextStyle(fontSize: 20),
          ),
          RaisedButton(
            child: const Text("Sign in"),
            onPressed: () async {
              var result = await _auth.siginAnono();
              if (result == null) {
                debugPrint(result);
              } else {
                debugPrint("Signed in");
                debugPrint(result);
              }
            },
          )
        ],
      ),
    );
  }
}
