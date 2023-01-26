import 'package:be_energised/repositories/general_providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firestoreRepositoryProvider =
    Provider<FirestoreRepository>((ref) => FirestoreRepository(ref));

class FirestoreRepository {
  final Ref ref;
  const FirestoreRepository(this.ref);

  Future<void> addUserToDB(User user) async {
    try {
      await ref.read(dbProvider).collection("users").doc(user.uid).set({
        "uid": user.uid,
        "displayName": user.displayName,
        "email": user.email,
        "photoUrl": user.photoURL,
      });
    } on FirebaseException catch (e) {
      print("[addUserToDB]: $e");
    }
  }
}
