// ignore_for_file: deprecated_member_use
import 'package:firebaseapp/Firebase_functions/screens/authenticate/sign_with_mobile_screen.dart';
import 'package:firebaseapp/constant/loading.dart';
import 'package:firebaseapp/services/auth.dart';
import 'package:flutter/material.dart';

class signin extends StatefulWidget {
  signin({Key? key}) : super(key: key);

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  AuthServices _auth = AuthServices();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 40,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        hoverElevation: 0,
        child: loading ? loadingindicator() : const Text("Sign in Anonomusly"),
        elevation: 0,
        color: Colors.amberAccent,
        onPressed: () async {
          setState(() {
            loading = true;
          });
          var result = await _auth.siginAnono();
          if (result == null) {
            debugPrint(result);
          }
          setState(() {
            loading = false;
          });
        },
      ),
    );
  }
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
  final _formkey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? error;
  bool loading = false;
  final AuthServices _auth = AuthServices();
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            validator: (value) {
              return value!.isEmpty ? 'Enter your email' : null;
            },
            onChanged: (value) {
              setState(() {
                email = value;
              });
            },
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
            validator: (value) {
              return value!.isEmpty ? 'Enter your password' : null;
            },
            onChanged: (value) {
              setState(() {
                password = value;
              });
            },
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
            width: 200,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.amberAccent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextButton(
              onPressed: () async {
                if (_formkey.currentState!.validate()) {
                  setState(() {
                    loading = true;
                  });
                  dynamic result = await _auth.sign_in_with_email_password(
                      email!, password!, context);
                  if (result == null) {
                    setState(() {
                      error = "Enter valid email and password";
                      loading = false;
                    });
                  }
                }
              },
              child: loading
                  ? loadingindicator()
                  : const Text(
                      "Sign in",
                      style: TextStyle(color: Colors.black),
                    ),
            ),
          ),
          //Text('$error'),
        ],
      ),
    );
  }
}

class sign_in_with_google extends StatefulWidget {
  sign_in_with_google({Key? key}) : super(key: key);

  @override
  State<sign_in_with_google> createState() => _sign_in_with_googleState();
}

class _sign_in_with_googleState extends State<sign_in_with_google> {
  AuthServices _auth = AuthServices();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.amberAccent,
        borderRadius: BorderRadius.circular(8),
      ),
      width: 200,
      height: 40,
      child: TextButton.icon(
        onPressed: () async {
          setState(() {
            loading = true;
          });
          final result = await _auth.sign_in_with_google();
          if (result == null) {
            setState(() {
              loading = false;
            });
          }
        },
        label: loading
            ? loadingindicator()
            : const Text(
                "Sign in with Google",
                style: TextStyle(color: Colors.black),
              ),
        icon: Image.asset('Assets/Images/google_logo.png'),
      ),
    );
  }
}

class sign_in_with_mobile_button extends StatefulWidget {
  @override
  State<sign_in_with_mobile_button> createState() =>
      sign_in_with_mobile_buttonState();
}

class sign_in_with_mobile_buttonState
    extends State<sign_in_with_mobile_button> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.amberAccent,
        borderRadius: BorderRadius.circular(8),
      ),
      width: 200,
      height: 40,
      child: TextButton.icon(
        onPressed: () async {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => signinwithmobile_screen()));
        },
        label: const Text(
          "Sign in with Mobile",
          style: TextStyle(color: Colors.black),
        ),
        icon: const Icon(
          Icons.phone,
          color: Colors.black,
        ),
      ),
    );
  }
}
