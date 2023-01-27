import 'package:be_energised/constants/constants.dart';
import 'package:be_energised/constants/palette.dart';
import 'package:be_energised/controllers/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserInfoDialog extends StatelessWidget {
  final User user;
  const UserInfoDialog({super.key, required this.user});

  static void show(BuildContext context, User user) {
    showDialog(
      context: context,
      barrierColor: Palette.black.withOpacity(0.3),
      builder: (context) => UserInfoDialog(user: user),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.only(top: 100, right: Const.defaultPadding),
        child: Container(
          width: 300,
          padding: const EdgeInsets.all(Const.defaultPadding),
          decoration: const BoxDecoration(
            color: Palette.grey,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                user.displayName!,
                style: const TextStyle(
                  color: Palette.lightGrey,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                user.email ?? "Unknown",
                style: TextStyle(
                  color: Palette.lightGrey.withOpacity(0.8),
                  fontSize: 14,
                ),
              ),
              const Divider(
                height: Const.defaultPadding * 2,
                color: Palette.lightGrey,
              ),
              Consumer(builder: (context, ref, _) {
                return GestureDetector(
                  onTap: () => ref
                      .read(authControllerProvider.notifier)
                      .signOut(context),
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                        width: 1,
                        color: const Color.fromARGB(255, 216, 82, 82),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        "Sign out",
                        style: TextStyle(
                          color: Palette.lightGrey,
                          fontSize: 18,
                        ),
                      ),
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
