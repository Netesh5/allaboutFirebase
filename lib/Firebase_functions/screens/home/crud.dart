import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseapp/Firebase_functions/screens/home/crud_tile.dart';
import 'package:firebaseapp/model/crud_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class crud extends StatefulWidget {
  crud({Key? key}) : super(key: key);

  @override
  State<crud> createState() => _crudState();
}

class _crudState extends State<crud> {
  @override
  Widget build(BuildContext context) {
    final crud = Provider.of<List<Crud>?>(context);
    if (crud == null) {
      debugPrint("Null");
    }

    return ListView.builder(
        itemCount: crud!.length,
        itemBuilder: (context, index) {
          return crudTile(crud: crud[index]);
        });
  }
}
