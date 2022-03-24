import "package:cloud_firestore/cloud_firestore.dart";

class DatabaseService {
  final String uid;

  DatabaseService({required this.uid});
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("CRUD");

  Future updateUserData(String title, String task, String time) async {
    return await collectionReference.doc(uid).set({
      "title": title,
      "task": task,
      "time": time,
    });
  }
}
