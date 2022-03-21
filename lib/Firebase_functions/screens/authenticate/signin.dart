// ignore_for_file: deprecated_member_use
import 'package:firebaseapp/services/auth.dart';
import 'package:flutter/material.dart';

Widget signin() {
  AuthServices _auth = AuthServices();
  return RaisedButton(
    child: const Text("Sign in Anonomuslyl"),
    onPressed: () async {
      var result = await _auth.siginAnono();
      if (result == null) {
        debugPrint(result);
      } else {
        debugPrint("Signed in");
        debugPrint(result.uid);
      }
    },
  );
}

Widget sign_in_with_email_password() {
  bool state = true;
  return Column(
    children: [
      const SizedBox(
        height: 20,
      ),
      TextFormField(
        decoration: InputDecoration(
            labelText: "E-mail",
            hintText: "Enter your email",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
      ),
      const SizedBox(
        height: 20,
      ),
      TextFormField(
        obscureText: state,
        decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(
                  // ignore: dead_code
                  state ? Icons.visibility_off : Icons.visibility),
              onPressed: () {
                setState() {
                  state = false;
                }
              },
            ),
            labelText: "Password",
            hintText: "Enter your password",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
      ),
      const SizedBox(
        height: 20,
      ),
      // ignore: avoid_unnecessary_containers
      Container(
        color: Colors.amberAccent,
        width: 150,
        child: TextButton(
          onPressed: () {},
          child: const Text("Sign in"),
        ),
      )
    ],
  );
}
