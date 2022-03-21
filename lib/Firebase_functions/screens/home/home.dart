// ignore_for_file: deprecated_member_use
import 'package:firebaseapp/services/auth.dart';
import 'package:flutter/material.dart';

class home extends StatelessWidget {
  AuthServices _auth = AuthServices();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Home Screen"),
        const SizedBox(
          height: 50,
        ),
        RaisedButton(
            child: const Text("Log out"),
            onPressed: () async {
              await _auth.signout();
            })
      ],
    );
  }
}
