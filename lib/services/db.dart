import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class db {
  final Stream<QuerySnapshot> crud =
      FirebaseFirestore.instance.collection("CRUD").snapshots();

  List docsItem = [];
  fetchData(AsyncSnapshot<QuerySnapshot> snapshot) {
    snapshot.data!.docs.map((DocumentSnapshot documentSnapshot) {
      Map<String, dynamic> data =
          documentSnapshot.data()! as Map<String, dynamic>;
      docsItem.add(data);
    }).toList();
  }

  writeData(AsyncSnapshot<QuerySnapshot> snapshot) {}

  deleteData(AsyncSnapshot<QuerySnapshot> snapshot){
    
  }
}
