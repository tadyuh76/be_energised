import 'package:be_energised/constants/constants.dart';
import 'package:be_energised/constants/palette.dart';
import 'package:be_energised/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class FacebookLoginButton extends ConsumerWidget {
  const FacebookLoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.read(authControllerProvider.notifier);

    return GestureDetector(
      onTap: () => authController.signInWithFb(context),
      child: Container(
        height: 60,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: Const.defaultPadding),
        decoration: BoxDecoration(
          color: Colors.blue.shade800,
          borderRadius: const BorderRadius.all(Radius.circular(30)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Login with Facebook",
              style: TextStyle(fontSize: 18, color: Palette.white),
            ),
            const SizedBox(width: Const.defaultPadding),
            Center(
              child: SvgPicture.asset(
                "assets/icons/facebook.svg",
                width: 32,
                height: 32,
                color: Palette.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
