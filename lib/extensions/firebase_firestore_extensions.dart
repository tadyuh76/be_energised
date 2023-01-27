import 'package:cloud_firestore/cloud_firestore.dart';

extension FirebaseFirestoreX on FirebaseFirestore {
  DocumentReference batteryRef(String uid, String today) {
    return collection("batteries").doc(uid);
  }

  CollectionReference activityListRef(String uid, String today) {
    return collection("batteries").doc(uid).collection(today);
  }

  // Query friendsBatteriesQuery(String uid) {
  //   return collection("batteries").where("friends", arrayContains: uid);
  // }

  Query<Map<String, dynamic>> friendsBatteriesQuery(String uid) {
    return collection("batteries").where("uid", isNotEqualTo: uid);
  }
}
// users/{uid}
// batteries/{uid}
// batteries/{uid}/{day}/{activityID}
