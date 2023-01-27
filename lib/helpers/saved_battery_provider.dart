import 'package:be_energised/models/battery.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final savedBatteryProvider =
    StateNotifierProvider<SavedBatteryProvider, Battery>(
  (ref) => SavedBatteryProvider(),
);

class SavedBatteryProvider extends StateNotifier<Battery> {
  SavedBatteryProvider() : super(Battery.empty());

  void saveBattery(Battery battery) => state = battery;
}
