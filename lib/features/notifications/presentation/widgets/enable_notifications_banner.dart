import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:mesh_gradient/mesh_gradient.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/fonts.dart';
import '../../../../core/utils/global_values.dart';
import '../controllers/notifications_controller.dart';

class EnableNotificationsBanner extends GetView<NotificationsController> {
  const EnableNotificationsBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(kCornerRadiusM),
      child: AnimatedMeshGradient(
        colors: [
          ThemeColors.lightBlue,
          ThemeColors.lightBlue,
          Theme.of(context).brightness == Brightness.dark
              ? ThemeColors.darkerBlue
              : ThemeColors.primary.shade300,
          Theme.of(context).brightness == Brightness.dark
              ? ThemeColors.darkerBlue
              : ThemeColors.primary.shade300,
        ],
        options: AnimatedMeshGradientOptions(
          speed: 1,
        ),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(kPaddingM),
          child: Stack(
            children: [
              const Positioned(
                right: 0,
                child: Icon(
                  HugeIcons.strokeRoundedCancel01,
                  color: ThemeColors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(kPadding),
                child: Row(
                  children: [
                    const Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Enable Notifications",
                            style: TextStyle(
                                color: ThemeColors.white,
                                fontSize: kFontSizeL,
                                fontFamily: FontFamily.montserrat,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "Receive notifications for your appointments, reminders and more",
                            style: TextStyle(
                              color: ThemeColors.white,
                              fontFamily: FontFamily.montserrat,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Obx(() {
                      return Expanded(
                        child: Switch(
                          value: controller.notificationsEnabled.value,
                          onChanged: (value) {
                            if (value) {
                              controller.requestNotificationsPermission();
                            }
                          },
                        ),
                      );
                    })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
