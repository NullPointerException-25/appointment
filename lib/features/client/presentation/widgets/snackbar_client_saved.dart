import 'package:appointments_manager/core/utils/colors.dart';
import 'package:appointments_manager/core/utils/global_values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarClientSaved extends GetSnackBar {
  const SnackBarClientSaved({super.key});

  GetSnackBar build(BuildContext context) {
    return GetSnackBar(
      title: "Client saved",
      message: "Client has been saved",
      snackPosition: SnackPosition.TOP,
      borderRadius: kCornerRadiusM,
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? ThemeColors.darkBlue
          : ThemeColors.lightBlue,
      duration: const Duration(seconds: 3),
      isDismissible: true,
    );
  }
}
