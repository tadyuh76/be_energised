import 'package:be_energised/constants/constants.dart';
import 'package:be_energised/constants/palette.dart';
import 'package:be_energised/controllers/auth_controller.dart';
import 'package:be_energised/controllers/battery_controller.dart';
import 'package:be_energised/screens/battery/widgets/battery_bottom_sheet.dart';
import 'package:be_energised/screens/battery/widgets/battery_widget.dart';
import 'package:be_energised/widgets/background.dart';
import 'package:be_energised/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BatteryScreen extends StatelessWidget {
  static const routeName = "/battery";
  const BatteryScreen({super.key, this.readOnly = false});

  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Background(
      name: "battery",
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 120),
          child: CustomAppBar(),
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  Consumer(builder: (context, ref, _) {
                    final displayName =
                        ref.read(batteryControllerProvider).value!.displayName;
                    return Text(
                      "$displayName's Battery",
                      style: const TextStyle(
                        fontSize: 24,
                        color: Palette.lightGrey,
                      ),
                    );
                  }),
                  const SizedBox(height: Const.defaultPadding),
                  IgnorePointer(
                    ignoring: readOnly,
                    child: const BatteryWidget(),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
            const BatteryBottomSheet(),
          ],
        ),
      ),
    );
  }
}
