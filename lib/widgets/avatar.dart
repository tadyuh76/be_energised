import 'package:be_energised/constants/palette.dart';
import 'package:be_energised/widgets/dialogs/user_info_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final User user;
  const Avatar({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => UserInfoDialog.show(context, user),
      child: Container(
        width: 60,
        height: 60,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          gradient: Palette.greenGradient,
        ),
        alignment: Alignment.center,
        child: CircleAvatar(
          radius: 26,
          backgroundImage: NetworkImage(user.photoURL!),
          backgroundColor: Palette.green,
        ),
      ),
    );
  }
}
