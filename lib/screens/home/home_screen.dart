import 'package:be_energised/constants/palette.dart';
import 'package:be_energised/controllers/auth_controller.dart';
import 'package:be_energised/repositories/fb_auth_repository.dart';
import 'package:be_energised/screens/battery/battery_screen.dart';
import 'package:be_energised/screens/friends/friends_screen.dart';
import 'package:be_energised/screens/home/home_button.dart';
import 'package:be_energised/widgets/background.dart';
import 'package:be_energised/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  static const routeName = '/';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authControllerProvider);

    return Background(
      name: "home",
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 120),
          child: CustomAppBar(),
        ),
        body: SizedBox.expand(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Be Energised!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Palette.lightGrey,
                ),
              ),
              const SizedBox(height: 30),
              HomeButton(
                onTap: () => Navigator.pushNamed(
                  context,
                  BatteryScreen.routeName,
                ),
                iconName: "battery",
                text: "My Battery",
              ),
              const SizedBox(height: 30),
              HomeButton(
                onTap: () => Navigator.pushNamed(
                  context,
                  FriendsScreen.routeName,
                ),
                iconName: "friends",
                text: "Friends",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
