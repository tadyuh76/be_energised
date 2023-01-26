import 'package:be_energised/controllers/auth_controller.dart';
import 'package:be_energised/models/activity.dart';
import 'package:be_energised/repositories/activity_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final activityListControllerProvider =
    StateNotifierProvider<ActivityController, AsyncValue<List<Activity>>>(
        (ref) {
  final uid = ref.read(authControllerProvider)!.uid;
  return ActivityController(ref, uid)..getActivityList();
});

class ActivityController extends StateNotifier<AsyncValue<List<Activity>>> {
  final Ref ref;
  final String uid;
  ActivityController(this.ref, this.uid) : super(const AsyncLoading());

  Future<void> getActivityList() async {
    try {
      final list =
          await ref.read(activityRepositoryProvider).getActivities(uid);
      if (mounted) state = AsyncData(list);
      print(list);
    } catch (e, st) {
      state = AsyncError(e, st);
      print("[getActivityList]: $e");
    }
  }

  void addActivity(Activity activity) {
    if (mounted) state = AsyncData([...state.value!, activity]);
  }
}
