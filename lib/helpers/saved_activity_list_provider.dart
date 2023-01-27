import 'package:be_energised/models/activity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final savedActivityListProvider =
    StateNotifierProvider<SavedActivityListProvider, List<Activity>>(
  (ref) => SavedActivityListProvider(),
);

class SavedActivityListProvider extends StateNotifier<List<Activity>> {
  SavedActivityListProvider() : super([]);

  void saveList(List<Activity> list) => state = list;
}
