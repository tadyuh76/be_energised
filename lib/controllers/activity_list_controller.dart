import 'package:be_energised/controllers/auth_controller.dart';
import 'package:be_energised/helpers/saved_activity_list_provider.dart';
import 'package:be_energised/models/activity.dart';
import 'package:be_energised/repositories/activity_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final activityListControllerProvider =
    StateNotifierProvider<ActivityController, AsyncValue<List<Activity>>>(
        (ref) {
  final uid = ref.read(authControllerProvider)!.uid;
  return ActivityController(ref, uid)..getActivityList(uid);
});

class ActivityController extends StateNotifier<AsyncValue<List<Activity>>> {
  final Ref ref;
  final String uid;
  ActivityController(this.ref, this.uid) : super(const AsyncLoading());

  Future<void> getActivityList(String uidToGet) async {
    try {
      final list =
          await ref.read(activityRepositoryProvider).getActivities(uidToGet);

      if (mounted) {
        state = AsyncData(list);
        if (uidToGet == uid) {
          ref.read(savedActivityListProvider.notifier).saveList(list);
        }
      }
    } catch (e, st) {
      state = AsyncError(e, st);
      print("[getActivityList]: $e");
    }
  }

  void addActivity(Activity activity) {
    if (mounted) state = AsyncData([...state.value!, activity]);
  }

  void updateList(List<Activity> list) => state = AsyncData(list);

  void refresh() {
    final savedList = ref.read(savedActivityListProvider);
    if (savedList.isEmpty) return;

    state = AsyncData(savedList);
  }
}
