import 'package:be_energised/constants/palette.dart';
import 'package:be_energised/widgets/background.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Background(
      name: "statistics",
      child: Center(
        child: CircularProgressIndicator(
          color: Palette.lightGrey,
        ),
      ),
    );
  }
}
