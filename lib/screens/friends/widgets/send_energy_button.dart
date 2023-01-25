import 'package:be_energised/constants/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SendEnergyButton extends StatelessWidget {
  const SendEnergyButton({
    super.key,
    required this.onTap,
    this.disabled = false,
  });
  final bool disabled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: disabled ? 0.7 : 1,
      child: GestureDetector(
        onTap: disabled ? () {} : onTap,
        child: Container(
          width: 90,
          height: 30,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: disabled ? null : Palette.greenGradient,
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          child: Container(
            width: 90 - 2,
            height: 30 - 2,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              color: disabled ? Palette.black : Palette.grey,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Send",
                  style: TextStyle(
                    fontSize: 12,
                    color: Palette.lightGrey,
                  ),
                ),
                SvgPicture.asset(
                  "assets/icons/energy.svg",
                  width: 16,
                  height: 16,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
