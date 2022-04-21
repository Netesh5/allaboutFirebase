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
  List color = [Colors.purpleAccent, Colors.blueAccent];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _db.crud,
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          _db.fetchData(snapshot);
          return ListView.builder(
            itemCount: _db.docsItem.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: ObjectKey(_db.docsItem.length),
                secondaryBackground: IconButton(
                  alignment: Alignment.centerRight,
                  icon: Icon(Icons.delete),
                  onPressed: () {},
                ),
                background: IconButton(
                  alignment: Alignment.centerLeft,
                  icon: Icon(Icons.edit),
                  onPressed: () {},
                ),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  _db.deleteData(_db.docsItem[index]["id"], context);
                },
                child: ListTile(
                  title: Text(_db.docsItem[index]["title"] ?? "title"),
                  subtitle: Text(_db.docsItem[index]["task"] ?? "task"),
                  trailing: Text("Time: ${_db.docsItem[index]["time"]}"),
                ),
              );
            },
          );
        });
  }
}
