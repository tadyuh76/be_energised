import 'package:be_energised/constants/constants.dart';
import 'package:be_energised/constants/palette.dart';
import 'package:be_energised/controllers/activity_list_controller.dart';
import 'package:be_energised/controllers/battery_controller.dart';
import 'package:be_energised/models/battery.dart';
import 'package:be_energised/screens/battery/battery_screen.dart';
import 'package:be_energised/screens/friends/widgets/friend_battery.dart';
import 'package:be_energised/screens/friends/widgets/send_energy_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class FriendCard extends ConsumerWidget {
  final Battery battery;
  const FriendCard({super.key, required this.battery});

  void _navigate(BuildContext context, WidgetRef ref) {
    ref.read(batteryControllerProvider.notifier).updateBattery(battery);
    ref
        .read(activityListControllerProvider.notifier)
        .getActivityList(battery.uid!);

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const BatteryScreen(readOnly: true),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => _navigate(context, ref),
      child: Container(
        height: 100,
        margin: const EdgeInsets.only(bottom: Const.defaultPadding),
        padding: const EdgeInsets.all(Const.defaultPadding),
        decoration: const BoxDecoration(
          color: Palette.grey,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(battery.photoURL),
              backgroundColor: Palette.green,
            ),
            const SizedBox(width: Const.defaultPadding),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        battery.displayName,
                        style: const TextStyle(
                          color: Palette.lightGrey,
                          fontSize: 16,
                          height: 1.5,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset(
                          "assets/icons/more.svg",
                          width: 16,
                          height: 16,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FriendBattery(percentage: battery.percentage),
                      SendEnergyButton(onTap: () {}),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
