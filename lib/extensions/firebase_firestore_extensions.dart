import 'package:cloud_firestore/cloud_firestore.dart';

extension FirebaseFirestoreX on FirebaseFirestore {
  DocumentReference batteryRef(String uid, String today) {
    return collection("batteries").doc(uid);
  }

  CollectionReference activityListRef(String uid, String today) {
    return collection("batteries")
        .doc(uid)
        .collection("activityLists")
        .doc(today)
        .collection("activities");
  }
}
// users/{uid}
// batteries/{uid}
// batteries/{uid}/activityLists/{day}/activities/{activityID}
