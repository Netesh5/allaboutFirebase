import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseapp/model/user.dart';
import 'package:flutter/widgets.dart';

class db {
  final Stream<QuerySnapshot> crud =
      FirebaseFirestore.instance.collection("CRUD").snapshots();
  CollectionReference _collectionReference =
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

  writeData(AsyncSnapshot<QuerySnapshot> snapshot) {}

  Future<void> deleteData(id) {
    return _collectionReference.doc(id).delete();
  }

  updateData(AsyncSnapshot<QuerySnapshot> snapshot) {}
}
