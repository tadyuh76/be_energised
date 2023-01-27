import 'package:be_energised/constants/palette.dart';
import 'package:be_energised/controllers/battery_controller.dart';
import 'package:be_energised/screens/battery/widgets/activity_panel.dart';
import 'package:be_energised/screens/battery/widgets/battery_controller.dart';
import 'package:be_energised/utils/percentage_to_cells.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BatteryWidget extends ConsumerWidget {
  const BatteryWidget({super.key});

  List<Widget> _renderBatteryCells(int percentage) {
    final batteryCells = percentageToCells(percentage);

    if (batteryCells.isEmpty) return [const SizedBox(width: double.infinity)];
    return batteryCells.reversed.map((cellValue) {
      if (cellValue == -1) return const SizedBox(height: 10);

      return Container(
        width: double.infinity,
        height: cellValue / 20 * 50,
        decoration: BoxDecoration(
          gradient: percentage > 50
              ? Palette.greenGradient
              : percentage > 20
                  ? Palette.yellowGradient
                  : Palette.redGradient,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
      );
    }).toList();
  }

  void _displayActivityPanel(BuildContext context) {
    ActivityPanel.show(context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(batteryControllerProvider).when(
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => const Center(child: CircularProgressIndicator()),
          data: (battery) => GestureDetector(
            onTap: () => _displayActivityPanel(context),
            child: Column(
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
                const SizedBox(height: 10),
                Container(
                  height: 330,
                  width: 200,
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    color: Palette.grey.withOpacity(0.8),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: _renderBatteryCells(battery.percentage),
                      ),
                      Positioned(
                        top: -25,
                        left: -80,
                        child: BatteryInfo(percentage: battery.percentage),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
  }
}
