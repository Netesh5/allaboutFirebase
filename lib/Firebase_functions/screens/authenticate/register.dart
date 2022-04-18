import 'package:firebaseapp/services/auth.dart';
import "package:flutter/material.dart";

class register extends StatefulWidget {
  register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  bool _isobscure = true;
  String? email;
  String? password;
  String? error;
  AuthServices _auth = AuthServices();
  final _formkey = GlobalKey<FormState>();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.amberAccent,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              const Text(
                "Register",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
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
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (value) {
                  return value!.length < 6
                      ? 'Enter password 6+ chars long'
                      : null;
                },
                obscureText: _isobscure,
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
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
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
                      dynamic result = await _auth.register_with_email_password(
                          email!, password!, context);

                      if (result == null) {
                        setState(() {
                          error = 'Enter valid email and password';
                          loading = false;
                        });
                      }
                    }
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //Text(error!,style: const TextStyle(color: Colors.red),)
            ],
          ),
        ),
      )),
    );
  }
}
