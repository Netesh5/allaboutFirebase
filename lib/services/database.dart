import "package:cloud_firestore/cloud_firestore.dart";
import 'package:firebaseapp/model/crud_model.dart';
import 'package:firebaseapp/model/user.dart';

class DatabaseService {
  final String? uid;

  DatabaseService({this.uid});
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("CRUD");

  Future updateUserData(String title, String task, String time) async {
    return await collectionReference.doc(uid).set({
      "title": title,
      "task": task,
      "time": time,
    });
  }

  List<Crud> _crudListformSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Crud(
          title: doc.get('title') ?? "",
          task: doc.get('task') ?? "",
          time: doc.get('time') ?? "0");
    }).toList();
  }

  //user data from snapshot

  userData _userDatafromSnapshot(DocumentSnapshot snapshot) {
    return userData(
        uid: uid,
        title: snapshot.get('title'),
        task: snapshot.get('task'),
        time: snapshot.get('time'));
  }

  Stream<List<Crud>> get crud {
    return collectionReference.snapshots().map(_crudListformSnapshot);
  }

  Stream<userData> get datafromSnapshot {
    return collectionReference
        .doc(uid)
        .snapshots()
        .map((_userDatafromSnapshot));
  }
}
