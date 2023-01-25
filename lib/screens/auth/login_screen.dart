import 'package:be_energised/constants/palette.dart';
import 'package:be_energised/controllers/auth_controller.dart';
import 'package:be_energised/widgets/background.dart';
import 'package:be_energised/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      name: "home",
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 120),
          child: CustomAppBar(),
        ),
        body: SizedBox.expand(
          child: Column(
            children: [
              const Text(
                "Be Energised!",
                style: TextStyle(
                  color: Palette.lightGrey,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              Consumer(builder: (context, ref, _) {
                return GestureDetector(
                  onTap: () => ref
                      .read(authControllerProvider.notifier)
                      .signInWithFb(context),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                    ),
                    child: const Icon(
                      Icons.facebook_rounded,
                      color: Palette.white,
                      size: 64,
                    ),
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
