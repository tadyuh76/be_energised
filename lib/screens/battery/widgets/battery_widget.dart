import 'package:be_energised/constants/palette.dart';
import 'package:be_energised/screens/battery/widgets/battery_controller.dart';
import 'package:be_energised/utils/percentage_to_cells.dart';
import 'package:flutter/material.dart';

class BatteryWidget extends StatelessWidget {
  const BatteryWidget({super.key, required this.percentage});
  final int percentage;

  List<Widget> _renderBatteryCells() {
    final batteryCells = percentageToCells(percentage);

    return batteryCells.reversed.map((cellValue) {
      if (cellValue == -1) return const SizedBox(height: 10);

      return Container(
        width: double.infinity,
        height: cellValue / 20 * 50,
        decoration: const BoxDecoration(
          gradient: Palette.greenGradient,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 40,
          decoration: BoxDecoration(
            color: Palette.grey.withOpacity(0.8),
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20),
              bottom: Radius.circular(5),
            ),
          ),
        ),
        SizedBox(
          width: 300,
          height: 345,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: 330,
                width: 200,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Palette.grey.withOpacity(0.8),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                alignment: Alignment.bottomCenter,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BatteryController(percentage: percentage),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            width: 160,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 25),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: _renderBatteryCells(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
