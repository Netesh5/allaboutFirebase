import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseapp/services/db.dart';
import 'package:flutter/material.dart';

class crud2 extends StatefulWidget {
  const crud2({Key? key}) : super(key: key);

  @override
  State<crud2> createState() => _crud2State();
}

class _crud2State extends State<crud2> {
  db _db = db();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot?>(
        stream: _db.crud,
        builder: (context, AsyncSnapshot<QuerySnapshot?>? snapshot) {
          _db.fetchData(snapshot);
          return ListView.builder(
            itemCount: _db.docsItem.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(_db.docsItem[index]["title"]),
                subtitle: Text(_db.docsItem[index]["task"]),
                trailing: Text("Time: ${_db.docsItem[index]["time"]}"),
              );
            },
          );
        });
  }
}
