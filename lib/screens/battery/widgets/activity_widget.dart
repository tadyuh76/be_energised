import 'package:be_energised/constants/constants.dart';
import 'package:be_energised/constants/palette.dart';
import 'package:be_energised/models/activity.dart';
import 'package:flutter/material.dart';

class ActivityWidget extends StatelessWidget {
  final Activity activity;
  const ActivityWidget({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
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
            backgroundImage:
                AssetImage("assets/activity_icons/${activity.icon}.png"),
          ),
          const SizedBox(width: Const.defaultPadding),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                activity.name,
                style: const TextStyle(color: Palette.lightGrey, fontSize: 16),
              ),
              Text(
                "${activity.prevPercentage}% -> ${activity.curPercentage}% - ${activity.time} Today",
                style: TextStyle(
                  color: Palette.lightGrey.withOpacity(0.5),
                  fontSize: 12,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
