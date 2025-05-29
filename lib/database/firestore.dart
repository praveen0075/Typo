import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Firestore {
  User? currentUser = FirebaseAuth.instance.currentUser;

  CollectionReference postRef = FirebaseFirestore.instance.collection("Posts");

  Future<void> addPost(String msg) {
    return postRef.add({
      "currentUserEmail": currentUser!.email,
      "message": msg,
      "TimeStamp": Timestamp.now(),
    });
  }

  Stream<QuerySnapshot> getPosts() {
    final posts =
        FirebaseFirestore.instance
            .collection("Posts")
            .orderBy("TimeStamp", descending: true)
            .snapshots();
    return posts;
  }
}
