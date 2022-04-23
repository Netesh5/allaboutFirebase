import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class pushNotificationScreen extends StatefulWidget {
  @override
  State<pushNotificationScreen> createState() => _pushNotificationScreenState();
}

//to start firebase background services as we need to send notification while running,inBackground or closed
class _pushNotificationScreenState extends State<pushNotificationScreen> {
  Future<void> backgroundHandler(RemoteMessage message) async {
    debugPrint(message.data.toString());
    debugPrint(message.notification!.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.amberAccent,
        title: const Text(
          "Push Notification",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  }
}
