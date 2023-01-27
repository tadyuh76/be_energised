import 'package:be_energised/controllers/auth_controller.dart';
import 'package:be_energised/models/battery.dart';
import 'package:be_energised/repositories/general_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:be_energised/extensions/firebase_firestore_extensions.dart';

final friendsListControllerProvider =
    StateNotifierProvider<FriendsListController, AsyncValue<List<Battery>>>(
  (ref) {
    final uid = ref.watch(authControllerProvider)!.uid;
    return FriendsListController(ref, uid)..getFriendsList();
  },
);

class FriendsListController extends StateNotifier<AsyncValue<List<Battery>>> {
  final Ref ref;
  final String uid;
  FriendsListController(this.ref, this.uid) : super(const AsyncLoading());

  Future<void> getFriendsList() async {
    try {
      final query = ref.read(dbProvider).friendsBatteriesQuery(uid);
      final snap = await query.get();
      final data = snap.docs.map((e) => Battery.fromJson(e.data())).toList();

      if (mounted) state = AsyncData(data);
    } catch (e, st) {
      state = AsyncError(e, st);
      print("[getFriendsList]: $e");
    }
  }
}
