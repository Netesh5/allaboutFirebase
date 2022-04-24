import 'package:flutter/material.dart';

class demoScreen extends StatelessWidget {
  final id;
  const demoScreen({Key? key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Demo Screen",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: Container(
          child: Text(id),
        ),
      ),
    );
  }
}
