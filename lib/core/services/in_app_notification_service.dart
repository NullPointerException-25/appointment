import 'package:appointments_manager/core/utils/colors.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InAppNotificationService extends GetxService {
  static InAppNotificationService get to =>
      Get.find<InAppNotificationService>();

  void showNotificationSuccess(String message, {String? title} ) {
    ElegantNotification.success(
      width: 300,
      isDismissable: false,
      displayCloseButton: false,
      animationCurve: Curves.easeInOut,
      background: ThemeColors.darkBlue,
      position: Alignment.topRight,
      animation: AnimationType.fromRight,
      title: title != null
          ? Text(
              title,
              style: const TextStyle(color: ThemeColors.white),
            )
          : null,
      description: Text(
        message,
        style: const TextStyle(color: ThemeColors.white),
      ),
    ).show(Get.context!);
  }
}
