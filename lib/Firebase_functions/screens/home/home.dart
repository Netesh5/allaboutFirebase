// ignore_for_file: deprecated_member_use
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseapp/Firebase_functions/screens/home/crud.dart';
import 'package:firebaseapp/Firebase_functions/screens/home/crud_form.dart';
import 'package:firebaseapp/services/auth.dart';
import 'package:firebaseapp/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../model/crud_model.dart';

class home extends StatefulWidget {
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  AuthServices _auth = AuthServices();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Crud>?>.value(
      value: DatabaseService().crud,
      initialData: null,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.amberAccent,
            child: const Icon(
              Icons.add,
              color: Colors.black,
            ),
            onPressed: () {
              _showBottomSheet();
            }),
        appBar: AppBar(
          title: const Text(
            "CRUD Operations",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.amberAccent,
          centerTitle: true,
          actions: [
            FlatButton(
                child: const Text("Log out",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
                onPressed: () async {
                  await _auth.signout();
                }),
          ],
        ),
        body: SafeArea(
          child: crud(),
        ),
      ),
    );
  }

  void _showBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height / 1.6,
              child: crud_form(),
            ),
          );
        });
  }
}
