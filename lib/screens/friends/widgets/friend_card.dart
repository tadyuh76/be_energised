import 'package:be_energised/constants/constants.dart';
import 'package:be_energised/constants/palette.dart';
import 'package:be_energised/screens/friends/widgets/friend_battery.dart';
import 'package:be_energised/screens/friends/widgets/send_energy_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FriendCard extends StatelessWidget {
  const FriendCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
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
            backgroundImage: AssetImage("assets/avatar.jpg"),
          ),
          const SizedBox(width: Const.defaultPadding),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Dat Huy",
                      style: TextStyle(
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
                    const FriendBattery(percentage: 72),
                    SendEnergyButton(onTap: () {}),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
