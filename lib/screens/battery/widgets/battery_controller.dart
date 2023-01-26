import 'package:be_energised/constants/palette.dart';
import 'package:be_energised/widgets/gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BatteryInfo extends StatelessWidget {
  final int percentage;
  const BatteryInfo({super.key, required this.percentage});

  Gradient get gradient => percentage > 50
      ? Palette.greenGradient
      : percentage > 20
          ? Palette.yellowGradient
          : Palette.redGradient;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 70,
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              color: Palette.grey,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 24,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      GradientText(
                        text: percentage.toString(),
                        gradient: gradient,
                        style: const TextStyle(fontSize: 20),
                      ),
                      GradientText(
                        text: "%",
                        gradient: percentage > 50
                            ? Palette.greenGradient
                            : percentage > 20
                                ? Palette.yellowGradient
                                : Palette.redGradient,
                        style: const TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                ),
                SvgPicture.asset(
                  "assets/icons/holder.svg",
                  width: 16,
                  height: 16,
                  color: Palette.lightGrey,
                )
              ],
            ),
          ),
          const SizedBox(width: 5),
          Image.asset(
            "assets/icons/pointer.png",
            width: 15,
            height: 15,
            color: Palette.lightGrey,
          ),
        ],
      ),
    );
  }
}
