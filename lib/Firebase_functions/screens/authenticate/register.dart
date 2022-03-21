import "package:flutter/material.dart";

class register extends StatefulWidget {
  register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  bool _isobscure = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(10.0),
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
      ),
    ));
  }
}
