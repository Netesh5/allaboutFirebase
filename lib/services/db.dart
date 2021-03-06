import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class db {
  final Stream<QuerySnapshot> crud =
      FirebaseFirestore.instance.collection("CRUD").snapshots();
  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection("CRUD");

  List docsItem = [];

  fetchData(AsyncSnapshot<QuerySnapshot> snapshot) {
    snapshot.data?.docs.map((DocumentSnapshot documentSnapshot) {
      Map<String, dynamic> data =
          documentSnapshot.data()! as Map<String, dynamic>;
      docsItem.add(data);
      data["id"] = documentSnapshot.id;
    }).toList();
  }

  writeData(String title, String task, String time, context) {
    return _collectionReference.add({
      "title": title,
      "task": task,
      "time": time,
    }).then((value) => showsnackbar(context, "Task Added"));
  }

  Future<void> deleteData(id, context) {
    return _collectionReference
        .doc(id)
        .delete()
        .then((value) => showsnackbar(context, "Task deleted"));
  }

  Future updateData(id, title, task, time, context) {
    return _collectionReference.doc(id).update({
      "title": title,
      "task": task,
      "time": time,
    }).then((value) => showsnackbar(context, "Task updated"));
  }

  void showsnackbar(BuildContext context, String text) {
    final snackBar = SnackBar(
      content: Text(
        text,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
