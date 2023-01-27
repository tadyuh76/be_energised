import 'package:be_energised/constants/constants.dart';
import 'package:be_energised/constants/palette.dart';
import 'package:be_energised/controllers/activity_list_controller.dart';
import 'package:be_energised/screens/battery/widgets/activity_widget.dart';
import 'package:be_energised/screens/statistics/statistics_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class BatteryBottomSheet extends StatelessWidget {
  const BatteryBottomSheet({super.key});

  Widget _renderHolder() {
    return Center(
      child: SizedBox(
        height: 10,
        width: 80,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Palette.white.withOpacity(0.4),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
        ),
      ),
    );
  }

  Widget _renderHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Battery Used",
          style: TextStyle(fontSize: 24, color: Palette.lightGrey),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, StatisticsScreen.routeName),
          child: Container(
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
              color: Palette.grey,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Center(
              child: SvgPicture.asset(
                "assets/icons/chart.svg",
                width: 32,
                height: 32,
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        color: Palette.darkGrey,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      child: DraggableScrollableSheet(
        snap: true,
        expand: false,
        initialChildSize: 0.15,
        minChildSize: 0.15,
        maxChildSize: 1,
        builder: (context, scrollController) => SingleChildScrollView(
          controller: scrollController,
          child: Padding(
            padding: const EdgeInsets.all(Const.defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _renderHolder(),
                const SizedBox(height: Const.defaultPadding),
                _renderHeader(context),
                const SizedBox(height: Const.defaultPadding),
                Consumer(
                  builder: (context, ref, _) {
                    return ref.watch(activityListControllerProvider).when(
                          data: (activityList) => ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: activityList.length,
                            itemBuilder: (context, index) {
                              return ActivityWidget(
                                activity: activityList[index],
                              );
                            },
                          ),
                          error: (e, st) => Text(e.toString()),
                          loading: () => const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
