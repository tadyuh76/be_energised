import 'package:be_energised/constants/activities.dart';
import 'package:be_energised/constants/constants.dart';
import 'package:be_energised/constants/palette.dart';
import 'package:flutter/material.dart';

class ActivityPickerDialog extends StatelessWidget {
  final String selectedIcon;
  final void Function(String) onChange;
  const ActivityPickerDialog({
    super.key,
    required this.selectedIcon,
    required this.onChange,
  });

  static void show(
    BuildContext context,
    String selectedIcon,
    void Function(String) onChange,
  ) {
    showDialog(
      context: context,
      barrierColor: Palette.black.withOpacity(0.3),
      builder: (context) => ActivityPickerDialog(
        selectedIcon: selectedIcon,
        onChange: onChange,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 260, left: 40, right: 20),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Palette.grey,
            borderRadius: const BorderRadius.all(Radius.circular(20))
                .copyWith(topLeft: const Radius.circular(5)),
          ),
          child: Padding(
              padding: const EdgeInsets.all(Const.defaultPadding),
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: activities.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => onChange(activities[index]),
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(
                            "assets/activity_icons/${activities[index]}.png",
                          ),
                          backgroundColor: Palette.darkGrey,
                        ),
                        if (activities[index] == selectedIcon)
                          const Positioned(
                            bottom: -2,
                            right: -2,
                            child: Icon(
                              Icons.check_circle,
                              color: Palette.lightGrey,
                              size: 16,
                            ),
                          )
                      ],
                    ),
                  );
                },
              )),
        ),
      ),
    );
  }
}
