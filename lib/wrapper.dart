import 'package:firebaseapp/Firebase_functions/screens/authenticate/auth_screen.dart';
import 'package:firebaseapp/Firebase_functions/screens/home/home.dart';
import 'package:firebaseapp/model/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<users?>(context);
    if (user == null) {
      return auth();
    } else {
      return home();
    }
  }
}
