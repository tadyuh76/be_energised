import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({super.key, required this.name, required this.child});
  final String name;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background/$name.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: child,
      ),
    );
  }
}
