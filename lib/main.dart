import 'package:firebaseapp/wrapper.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(firebase());
}

class firebase extends StatefulWidget {
  State<firebase> createState() => firebaseState();
}

class firebaseState extends State<firebase> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: wrapper(),
    );
  }
}
