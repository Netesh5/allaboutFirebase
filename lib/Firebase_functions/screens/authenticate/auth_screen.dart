import 'package:firebaseapp/Firebase_functions/screens/authenticate/register.dart';
import 'package:firebaseapp/Firebase_functions/screens/authenticate/signin.dart';
import 'package:flutter/material.dart';

class auth extends StatefulWidget {
  const auth({Key? key}) : super(key: key);

  @override
  State<auth> createState() => _authState();
}

class _authState extends State<auth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const Text(
                  "All About Firebase",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  child: Image.asset('Assets/Images/firebase_logo.png'),
                  height: 100,
                ),
                sign_in_with_email_password(),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      child: const Text("Register Now"),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => register()));
                      },
                    ),
                  ],
                ),
                const Divider(
                  indent: 50,
                  endIndent: 50,
                ),
                const SizedBox(
                  height: 15,
                ),
                signin(),
                const SizedBox(
                  height: 15,
                ),
                const Divider(
                  indent: 50,
                  endIndent: 50,
                ),
                const SizedBox(height: 15),
                sign_in_with_google(),
                const SizedBox(height: 15),
                sign_in_with_mobile_button(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
