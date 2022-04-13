import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseapp/main.dart';
import 'package:flutter/widgets.dart';

class db {
  Stream<QuerySnapshot> crud =
      FirebaseFirestore.instance.collection("CRUD").snapshots();

  List docsItem = [];
  fetchData(AsyncSnapshot<QuerySnapshot?>? snapshot) {
    snapshot!.data!.docs.map((DocumentSnapshot documentSnapshot) {
      Map data = documentSnapshot.data() as Map<String, dynamic>;
      docsItem.add(data);
    }).toList();
  }
}
