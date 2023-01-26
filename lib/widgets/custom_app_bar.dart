import 'package:be_energised/constants/constants.dart';
import 'package:be_energised/constants/palette.dart';
import 'package:be_energised/controllers/auth_controller.dart';
import 'package:be_energised/widgets/avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends ConsumerWidget {
  final bool home;
  const CustomAppBar({Key? key, this.home = false}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authControllerProvider);

    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 120,
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleSpacing: 0,
      title: Padding(
        padding: const EdgeInsets.all(Const.defaultPadding),
        child: Row(
          children: [
            if (home)
              _renderSettingsButton(context)
            else
              _renderBackButton(context),
            const Spacer(),
            if (user != null) Avatar(user: user),
          ],
        ),
      ),
    );
  }

  Widget _renderBackButton(BuildContext context) {
    return GestureDetector(
      onTap: Navigator.of(context).pop,
      child: Container(
        width: 60,
        height: 60,
        decoration: const BoxDecoration(
          color: Palette.background,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        alignment: Alignment.center,
        child: SvgPicture.asset(
          "assets/icons/back.svg",
          width: 32,
          height: 32,
          color: Palette.lightGrey,
        ),
      ),
    );
  }

  Widget _renderSettingsButton(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: SvgPicture.asset(
        "assets/icons/settings.svg",
        width: 60,
        height: 60,
      ),
    );
  }
}
