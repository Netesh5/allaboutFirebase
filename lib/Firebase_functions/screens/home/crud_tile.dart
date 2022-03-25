import 'package:flutter/material.dart';
import 'package:firebaseapp/model/crud_model.dart';

class crudTile extends StatelessWidget {
  final Crud? crud;
  crudTile({this.crud});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        child: ListTile(
          title: Text(crud!.title),
          subtitle: Text(crud!.task),
          trailing: Text("Time: ${crud!.time}"),
        ),
      ),
    );
  }
}
