import 'package:be_energised/constants/constants.dart';
import 'package:be_energised/constants/palette.dart';
import 'package:be_energised/screens/battery/widgets/battery_bottom_sheet.dart';
import 'package:be_energised/screens/battery/widgets/battery_widget.dart';
import 'package:be_energised/widgets/background.dart';
import 'package:be_energised/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class BatteryScreen extends StatelessWidget {
  static const routeName = "/battery";
  const BatteryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      name: "battery",
      child: Scaffold(
        extendBodyBehindAppBar: false,
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
                children: const [
                  Text(
                    "My Battery",
                    style: TextStyle(
                      fontSize: 32,
                      color: Palette.lightGrey,
                    ),
                  ),
                  SizedBox(height: Const.defaultPadding),
                  BatteryWidget(percentage: 76),
                  SizedBox(height: 30),
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
