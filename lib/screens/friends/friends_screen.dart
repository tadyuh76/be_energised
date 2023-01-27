import 'package:be_energised/constants/constants.dart';
import 'package:be_energised/constants/palette.dart';
import 'package:be_energised/controllers/friends_list_controller.dart';
import 'package:be_energised/screens/friends/widgets/friend_card.dart';
import 'package:be_energised/widgets/background.dart';
import 'package:be_energised/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FriendsScreen extends ConsumerWidget {
  static const routeName = "/friends";
  const FriendsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Background(
      name: "friends",
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 120),
          child: CustomAppBar(),
        ),
        body: RefreshIndicator(
          onRefresh:
              ref.read(friendsListControllerProvider.notifier).getFriendsList,
          child: Column(
            children: [
              const Text(
                "Friends",
                style: TextStyle(fontSize: 32, color: Palette.lightGrey),
              ),
              const SizedBox(height: Const.defaultPadding),
              Expanded(
                child: Builder(
                  builder: (context) {
                    return ref.watch(friendsListControllerProvider).when(
                          data: (batteryList) => ListView.builder(
                            padding: const EdgeInsets.symmetric(
                              horizontal: Const.defaultPadding,
                            ).copyWith(bottom: Const.defaultPadding),
                            physics: const BouncingScrollPhysics(),
                            itemCount: batteryList.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) =>
                                FriendCard(battery: batteryList[index]),
                          ),
                          error: (e, st) => Text(e.toString()),
                          loading: () => const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
