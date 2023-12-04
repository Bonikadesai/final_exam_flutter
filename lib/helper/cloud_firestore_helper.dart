import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_exam_flutter/helper/firebase_auth_helper.dart';

class FireStore_Helper {
  FireStore_Helper._();

  static final FireStore_Helper fireStore_Helper = FireStore_Helper._();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addTodo(String userId, String title) {
    return firestore.collection('todos').doc(userId).collection('tasks').add({
      'title': title,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getTodos(String userId) {
    return firestore
        .collection('todos')
        .doc(userId)
        .collection('tasks')
        .snapshots();
  }

  Future addUser({required Map<String, dynamic> data}) async {
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await firestore.collection("records").doc("users").get();

    Map<String, dynamic>? fetchedData = documentSnapshot.data();

    int Id = (fetchedData == null) ? 0 : fetchedData['id'];
    int Length = (fetchedData == null) ? 0 : fetchedData['length'];

    //TODO: check a user already exists or not
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await firestore.collection("users").get();

    List<QueryDocumentSnapshot<Map<String, dynamic>>> allDocs =
        querySnapshot.docs;

    bool isUserAlreadyExists = false;

    for (QueryDocumentSnapshot<Map<String, dynamic>> element in allDocs) {
      if (data['uid'] == element.data()['uid']) {
        isUserAlreadyExists = true;
        break;
      } else {
        isUserAlreadyExists = false;
        break;
      }
    }
    if (isUserAlreadyExists == false) {
      await firestore.collection("users").doc("${++Id}").set(data);

      await firestore
          .collection("records")
          .doc("users")
          .update({"id": Id, "length": ++Length});
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> fetchUsers() {
    return firestore
        .collection("users")
        .where("uid",
            isNotEqualTo: Auth_Helper.auth_helper.firebaseAuth.currentUser?.uid)
        .snapshots();
  }
}
