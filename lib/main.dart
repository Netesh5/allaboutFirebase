import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebaseapp/model/user.dart';
import 'package:firebaseapp/pushnotification/localnotification.dart';
import 'package:firebaseapp/services/auth.dart';
import 'package:firebaseapp/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  debugPrint(message.data.toString());
  debugPrint(message.notification!.title);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  // await Firebase.initializeApp(
  //     options: const FirebaseOptions(
  //         apiKey: "AIzaSyBw2H-ODzV2Pm8C8KpYInaI4ilZJ79R2QY",
  //         authDomain: "fir-functions-1a419.firebaseapp.com",
  //         projectId: "fir-functions-1a419",
  //         storageBucket: "fir-functions-1a419.appspot.com",
  //         messagingSenderId: "735913926564",
  //         appId: "1:735913926564:web:a6f3e161942ff4c3726b31"));
  LocalNotificationService.initialize();
  runApp(firebase());
}

//file

class firebase extends StatefulWidget {
  State<firebase> createState() => firebaseState();
}

class firebaseState extends State<firebase> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<users?>.value(
      catchError: (_, __) =>
          null, //StreamProvider<users?>, but no `catchError` was provided.
      value: AuthServices().user,
      initialData: null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: "ubuntu",
            iconTheme: const IconThemeData(color: Colors.black)),
        home: wrapper(),
      ),
    );
  }
}
