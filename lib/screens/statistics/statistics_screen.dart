import 'package:be_energised/constants/palette.dart';
import 'package:be_energised/widgets/background.dart';
import 'package:be_energised/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class StatisticsScreen extends StatelessWidget {
  static const routeName = "/statistics";
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      name: "statistics",
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 120),
          child: CustomAppBar(),
        ),
        body: SizedBox.expand(
          child: Column(
            children: [
              const Text(
                "My Statistics",
                style: TextStyle(color: Palette.lightGrey, fontSize: 32),
              )
            ],
          ),
        ),
      ),
    );
  }
}
