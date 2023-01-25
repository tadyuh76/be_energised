import 'package:be_energised/constants/constants.dart';
import 'package:be_energised/constants/palette.dart';
import 'package:flutter/material.dart';

class ActivityWidget extends StatelessWidget {
  const ActivityWidget({super.key});

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
          const CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage("assets/activity_icons/football.png"),
          ),
          const SizedBox(width: Const.defaultPadding),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Running",
                style: TextStyle(color: Palette.lightGrey, fontSize: 16),
              ),
              Text(
                "100% -> 90% - 9:01 Today",
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
