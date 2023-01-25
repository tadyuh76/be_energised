import 'package:be_energised/constants/constants.dart';
import 'package:be_energised/constants/palette.dart';
import 'package:be_energised/screens/friends/widgets/friend_card.dart';
import 'package:be_energised/widgets/background.dart';
import 'package:be_energised/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class FriendsScreen extends StatelessWidget {
  static const routeName = "/friends";
  const FriendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      name: "friends",
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 120),
          child: CustomAppBar(),
        ),
        body: Column(
          children: [
            const Text(
              "Friends",
              style: TextStyle(fontSize: 32, color: Palette.lightGrey),
            ),
            const SizedBox(height: Const.defaultPadding),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: Const.defaultPadding,
                ).copyWith(bottom: Const.defaultPadding),
                physics: const BouncingScrollPhysics(),
                itemCount: 8,
                shrinkWrap: true,
                itemBuilder: (context, index) => const FriendCard(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
