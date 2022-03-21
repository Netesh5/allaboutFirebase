// ignore_for_file: deprecated_member_use
import 'package:firebaseapp/services/auth.dart';
import 'package:flutter/material.dart';

Widget signin() {
  AuthServices _auth = AuthServices();
  return RaisedButton(
    child: const Text("Sign in Anonomusly"),
    elevation: 0,
    color: Colors.amberAccent,
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

// Widget sign_in_with_email_password() {
//   bool state = true;
class sign_in_with_email_password extends StatefulWidget {
  @override
  State<sign_in_with_email_password> createState() =>
      _sign_in_with_email_passwordState();
}

class _sign_in_with_email_passwordState
    extends State<sign_in_with_email_password> {
  @override
  bool _isobscure = true;
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          onChanged: (value) {},
          decoration: InputDecoration(
              labelText: "E-mail",
              hintText: "Enter your email",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          obscureText: _isobscure,
          onChanged: (value) {},
          decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(
                    // ignore: dead_code
                    _isobscure ? Icons.visibility_off : Icons.visibility),
                onPressed: () {
                  setState(() {
                    _isobscure = !_isobscure;
                  });
                },
              ),
              labelText: "Password",
              hintText: "Enter your password",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
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
            child: const Text(
              "Sign in",
              style: TextStyle(color: Colors.black),
            ),
          ),
        )
      ],
    );
  }
}
