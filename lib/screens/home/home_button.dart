import 'package:avatar_glow/avatar_glow.dart';
import 'package:be_energised/constants/palette.dart';
import "package:flutter/material.dart";

class HomeButton extends StatelessWidget {
  const HomeButton({
    super.key,
    required this.onTap,
    required this.iconName,
    required this.text,
  });
  final VoidCallback onTap;
  final String iconName;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AvatarGlow(
            endRadius: 70,
            child: Container(
              width: 140,
              height: 140,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(100)),
                color: Palette.green.withOpacity(0.3),
              ),
              alignment: Alignment.center,
              child: Image.asset(
                "assets/icons/$iconName.png",
                width: 90,
                height: 90,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            text,
            style: const TextStyle(
              color: Palette.lightGrey,
              fontSize: 24,
            ),
          )
        ],
      ),
    );
  }
}
