import 'package:be_energised/models/activity.dart';
import 'package:be_energised/repositories/general_providers.dart';
import 'package:be_energised/utils/date_format.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:be_energised/extensions/firebase_firestore_extensions.dart";

final activityRepositoryProvider =
    Provider<ActivityRepository>((ref) => ActivityRepository(ref));

class ActivityRepository {
  final Ref ref;
  const ActivityRepository(this.ref);

  String get todayStr => getDate(DateTime.now());

  Future<void> createActivity(String uid, Activity activity) async {
    try {
      final listRef = ref.read(dbProvider).activityListRef(uid, todayStr);
      await listRef.add(activity.toJson());
    } on FirebaseException catch (e) {
      print("[createActivity]: $e");
    }
  }

  Future<List<Activity>> getActivities(String uid) async {
    try {
      final listRef = ref.read(dbProvider).activityListRef(uid, todayStr);
      final snapshot = await listRef.get();
      if (snapshot.docs.isEmpty) return [];

      return snapshot.docs
          .map((e) => Activity.fromJson(e.data() as Map<String, dynamic>))
          .toList();
    } on FirebaseException catch (e) {
      rethrow;
    }
  }
}
