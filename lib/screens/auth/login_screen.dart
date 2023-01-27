import 'package:avatar_glow/avatar_glow.dart';
import 'package:be_energised/constants/palette.dart';
import 'package:be_energised/screens/auth/widgets/facebook_login_button.dart';
import 'package:be_energised/widgets/background.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = "/login";
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      name: "home",
      child: Scaffold(
        body: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AvatarGlow(
                duration: const Duration(seconds: 2),
                animate: true,
                glowColor: Palette.green,
                endRadius: 120,
                child: Image.asset(
                  "assets/icons/battery.png",
                  width: 120,
                  height: 120,
                ),
              ),
              const Text(
                "Be Energised!",
                style: TextStyle(
                  color: Palette.lightGrey,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 120),
              const FacebookLoginButton()
            ],
          ),
        ),
      ),
    );
  }
}
