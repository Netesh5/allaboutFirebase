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
                    child: const Text("Sign up"),
                    onPressed: () {},
                  ),
                ],
              ),
              const Divider(),
              const SizedBox(
                height: 20,
              ),
              signin(),
            ],
          ),
        ),
      ),
    );
  }
}
