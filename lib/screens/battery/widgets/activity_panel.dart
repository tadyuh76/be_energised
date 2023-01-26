import 'package:be_energised/constants/constants.dart';
import 'package:be_energised/constants/palette.dart';
import 'package:be_energised/controllers/battery_controller.dart';
import 'package:be_energised/models/activity.dart';
import 'package:be_energised/widgets/dialogs/activity_picker_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ActivityPanel extends StatefulWidget {
  const ActivityPanel({super.key});

  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Palette.black.withOpacity(0.3),
      builder: (context) => const ActivityPanel(),
    );
  }

  @override
  State<ActivityPanel> createState() => _ActivityPanelState();
}

class _ActivityPanelState extends State<ActivityPanel> {
  final TextEditingController _percentController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  String activityIcon = "dumbbell";

  void onChangeIcon(String iconName) {
    setState(() => activityIcon = iconName);
    Navigator.pop(context);
  }

  void onSubmit(WidgetRef ref) async {
    if (_nameController.text.isEmpty || _percentController.text.isEmpty) return;

    final name = _nameController.text;
    final curPercentage = int.parse(_percentController.text);
    final prevPercentage =
        ref.read(batteryControllerProvider).value!.percentage;

    //TODO: validate input percentage

    final activity = Activity(
      date: DateTime.now().toString(),
      name: name,
      icon: activityIcon,
      prevPercentage: prevPercentage,
      curPercentage: curPercentage,
      time: DateTime.now().toString(),
    );

    await ref.read(batteryControllerProvider.notifier).createActivity(activity);
    if (mounted) Navigator.of(context).pop();
  }

  Widget _renderSubmitButton() {
    return Consumer(builder: (context, ref, _) {
      return GestureDetector(
        onTap: () => onSubmit(ref),
        child: Container(
          height: 50,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            gradient: Palette.greenGradient,
            color: Palette.green,
          ),
          child: const Center(
            child: Text(
              "Submit",
              style: TextStyle(
                color: Palette.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Const.defaultPadding,
          vertical: 100,
        ),
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: Palette.black,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(Const.defaultPadding),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    GestureDetector(
                      onTap: Navigator.of(context).pop,
                      child: const Align(
                        alignment: Alignment.topRight,
                        child: Icon(
                          Icons.close,
                          color: Palette.lightGrey,
                          size: 24,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "New activity",
                          style: TextStyle(
                            color: Palette.lightGrey,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: Const.defaultPadding),
                        _PercentInput(controller: _percentController),
                        const SizedBox(height: Const.defaultPadding),
                        _NameAndIconInput(
                          activityIcon: activityIcon,
                          onChangeIcon: onChangeIcon,
                          nameController: _nameController,
                        ),
                        const SizedBox(height: Const.defaultPadding),
                        _renderSubmitButton(),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NameAndIconInput extends StatelessWidget {
  final String activityIcon;
  final void Function(String) onChangeIcon;
  final TextEditingController nameController;

  const _NameAndIconInput({
    Key? key,
    required this.activityIcon,
    required this.onChangeIcon,
    required this.nameController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          GestureDetector(
            onTap: () => ActivityPickerDialog.show(
              context,
              activityIcon,
              onChangeIcon,
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                  backgroundImage:
                      AssetImage("assets/activity_icons/$activityIcon.png"),
                  backgroundColor: Palette.grey,
                  radius: 25,
                ),
                const Positioned(
                  bottom: -6,
                  right: -6,
                  child: Icon(
                    Icons.change_circle,
                    color: Palette.lightGrey,
                    size: 24,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Material(
              color: Colors.transparent,
              child: TextField(
                controller: nameController,
                cursorColor: Palette.green,
                textAlignVertical: TextAlignVertical.center,
                style: const TextStyle(color: Palette.lightGrey, fontSize: 14),
                decoration: const InputDecoration(
                  filled: false,
                  isCollapsed: true,
                  contentPadding: EdgeInsets.all(15),
                  counterText: "",
                  hintText: "Activity name",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Palette.grey, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Palette.grey, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Palette.grey, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PercentInput extends StatelessWidget {
  const _PercentInput({
    Key? key,
    required TextEditingController controller,
  })  : _controller = controller,
        super(key: key);

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final battery = ref.read(batteryControllerProvider);

      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Palette.grey,
            ),
            child: Text(
              "${battery.value!.percentage}%",
              style: const TextStyle(
                color: Palette.lightGrey,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(width: 10),
          const Center(
            child: Icon(
              Icons.arrow_right_alt_rounded,
              size: 32,
              color: Palette.lightGrey,
            ),
          ),
          const SizedBox(width: 10),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(width: 2, color: Palette.grey),
            ),
            child: Center(
              child: Material(
                color: Colors.transparent,
                child: TextField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  autofocus: true,
                  cursorColor: Palette.green,
                  maxLength: 2,
                  textAlign: TextAlign.center,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    filled: false,
                    fillColor: Colors.transparent,
                    counterText: "",
                    hintStyle: TextStyle(color: Palette.lightGrey),
                  ),
                  style: const TextStyle(
                    color: Palette.lightGrey,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
          const Text(
            " %",
            style: TextStyle(color: Palette.lightGrey, fontSize: 18),
          )
        ],
      );
    });
  }
}
