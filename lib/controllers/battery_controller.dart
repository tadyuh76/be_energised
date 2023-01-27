import 'package:be_energised/controllers/activity_list_controller.dart';
import 'package:be_energised/controllers/auth_controller.dart';
import 'package:be_energised/helpers/saved_battery_provider.dart';
import 'package:be_energised/models/activity.dart';
import 'package:be_energised/models/battery.dart';
import 'package:be_energised/repositories/activity_repository.dart';
import 'package:be_energised/repositories/battery_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final batteryControllerProvider =
    StateNotifierProvider<BatteryController, AsyncValue<Battery>>((ref) {
  final uid = ref.watch(authControllerProvider)?.uid;
  return BatteryController(uid, ref)..getBattery();
});

class BatteryController extends StateNotifier<AsyncValue<Battery>> {
  final String? uid;
  final Ref ref;
  BatteryController(this.uid, this.ref) : super(const AsyncLoading());

  Future<void> getBattery({bool isRefreshing = false}) async {
    if (isRefreshing) state = const AsyncLoading();

    try {
      final batteryRepo = ref.read(batteryRepositoryProvider);
      final battery = await batteryRepo.getUserBattery(uid!);
      if (mounted) {
        state = AsyncData(battery);
        ref.read(savedBatteryProvider.notifier).saveBattery(battery);
      }
    } catch (e, st) {
      state = AsyncError(e, st);
      print("[getBattery]: $e");
    }
  }

  void updateBattery(Battery battery) {
    state = AsyncData(battery);
  }

  Future<void> createActivity(
    Activity activity, {
    bool isRefreshing = false,
  }) async {
    if (isRefreshing) state = const AsyncLoading();

    try {
      final energyConsumed = activity.prevPercentage - activity.curPercentage;
      final curBattery = state.value!;
      final newBattery = curBattery.copyWith(
        percentage: curBattery.percentage - energyConsumed,
      );

      await ref.read(batteryRepositoryProvider).updateBattery(uid!, newBattery);
      await ref.read(activityRepositoryProvider).createActivity(uid!, activity);
      ref.read(activityListControllerProvider.notifier).addActivity(activity);

      ref.read(savedBatteryProvider.notifier).saveBattery(newBattery);
      state = AsyncData(newBattery);
    } catch (e, st) {
      state = AsyncError(e, st);
      print("[createActivity]: $e");
    }
  }

  void refresh() {
    final savedBattery = ref.read(savedBatteryProvider);
    if (savedBattery == Battery.empty()) return;

    state = AsyncData(savedBattery);
  }
}
