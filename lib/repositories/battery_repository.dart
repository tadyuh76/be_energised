import 'package:be_energised/models/battery.dart';
import 'package:be_energised/repositories/general_providers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final batteryRepositoryProvider =
    Provider<BatteryRepository>((ref) => BatteryRepository(ref));

class BatteryRepository {
  final Ref ref;
  const BatteryRepository(this.ref);

  Future<void> createBattery(User user) async {
    try {
      final dbRef = ref.read(dbProvider).collection("batteries").doc(user.uid);
      final newBattery = Battery.newUser(
        displayName: user.displayName,
        photoURL: user.photoURL,
        uid: user.uid,
      );
      await dbRef.set(newBattery.toJson());
    } on FirebaseException catch (e) {
      print("[createBattery]: $e");
    }
  }

  Future<Battery> getUserBattery(String uid) async {
    try {
      final dbRef = ref.read(dbProvider).collection("batteries").doc(uid);
      final snap = await dbRef.get();
      Battery battery = Battery.fromJson(snap.data() as Map<String, dynamic>);

      if (DateTime.now().day != DateTime.parse(battery.date).day) {
        final chargedBattery = battery.charged(battery);
        await updateBattery(uid, chargedBattery);
        battery = chargedBattery;
      }

      return battery;
    } on FirebaseException catch (e) {
      rethrow;
    }
  }

  Future<void> updateBattery(String uid, Battery newBattery) async {
    try {
      final batteryRef = ref.read(dbProvider).collection("batteries").doc(uid);
      await batteryRef.update(newBattery.toJson());
    } on FirebaseException catch (e) {
      print("[updateBattery]: $e");
      rethrow;
    }
  }

  Future<void> saveBatteryToHistory() async {}
}
