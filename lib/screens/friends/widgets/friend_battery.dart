import 'package:be_energised/constants/palette.dart';
import 'package:be_energised/utils/percentage_to_cells.dart';
import 'package:flutter/material.dart';

class FriendBattery extends StatelessWidget {
  const FriendBattery({super.key, required this.percentage});
  final int percentage;

  List<Widget> _renderBatteryCells() {
    final batteryCells = percentageToCells(percentage);

    return batteryCells.map((cellValue) {
      if (cellValue == -1) return const SizedBox(width: 2);

      return Container(
        height: 20,
        width: (cellValue / 20) * 10,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(2)),
          gradient: Palette.greenGradient,
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 75,
      height: 30,
      child: Row(
        children: [
          Container(
            width: 68,
            height: 30,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              color: Palette.black.withOpacity(0.9),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: _renderBatteryCells(),
            ),
          ),
          const SizedBox(width: 2),
          SizedBox(
            width: 5,
            height: 12,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Palette.black.withOpacity(0.9),
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(2),
                  right: Radius.circular(5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
