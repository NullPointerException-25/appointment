import 'package:appointments_manager/core/utils/colors.dart';
import 'package:appointments_manager/core/utils/global_values.dart';
import 'package:appointments_manager/features/notifications/presentation/controllers/notifications_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../core/utils/fonts.dart';
import '../controllers/home_controller.dart';

class BottomAppbarResponsive extends StatefulWidget {
  const BottomAppbarResponsive({super.key});

  @override
  State<BottomAppbarResponsive> createState() => _BottomAppbarResponsiveState();
}

class _BottomAppbarResponsiveState extends State<BottomAppbarResponsive> {
  final controller = HomeController.to;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _getBottomAppBarHeight());
  }

  final GlobalKey _bottomAppBarKey = GlobalKey();

  void _getBottomAppBarHeight() {
    final RenderBox? renderBox =
        _bottomAppBarKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      controller.bottomAppBarHeight.value = renderBox.size.height;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      key: _bottomAppBarKey,
      notchMargin: 8,
      shape: const CircularNotchedRectangle(),
      color: Theme.of(context).colorScheme.onPrimary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: const Icon(HugeIcons.strokeRoundedHome01),
            onPressed: () {
              controller.changePage(0);
            },
          ),
          IconButton(
            icon: const Icon(HugeIcons.strokeRoundedCalendar01),
            onPressed: () {
              controller.changePage(1);
            },
          ),
          const SizedBox(width: 48),
          Stack(
            children: [
              Obx(() {
                if (NotificationsController.to.notifications.isEmpty) {
                  return const SizedBox();
                }
                return Positioned(
                    right: 0,
                    child: Container(
                      height: 18,
                      width: 18,
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(color: Theme.of(context).brightness==Brightness.light?
                      ThemeColors.errorRed: ThemeColors.lightBlue,
                      borderRadius: BorderRadius.circular(kCornerRadiusXXL)),
                      child: Center(
                        child: Text(
                          NotificationsController.to.notifications.length > 9
                              ? '9+'
                              : NotificationsController.to.notifications.length
                                  .toString(),
                          style:  const TextStyle(
                            fontSize: kFontSizeXS,
                            fontFamily: FontFamily.montserrat,
                            color: ThemeColors.white
                          ),
                        ),
                      ),
                    ));
              }),
              IconButton(
                icon: const Icon(HugeIcons.strokeRoundedNotification01),
                onPressed: () {
                  controller.changePage(2);
                },
              ),
            ],
          ),
          IconButton(
            icon: const Icon(HugeIcons.strokeRoundedUserGroup),
            onPressed: () {
              controller.changePage(3);
            },
          ),
        ],
      ),
    );
  }
}
