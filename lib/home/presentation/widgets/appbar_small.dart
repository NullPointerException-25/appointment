import 'package:appointments_manager/core/utils/global_values.dart';
import 'package:appointments_manager/home/presentation/controllers/home_controller.dart';
import 'package:appointments_manager/core/utils/colors.dart';
import 'package:appointments_manager/core/utils/translations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

class HomeAppBarSmall extends GetView<HomeController> {
  const HomeAppBarSmall({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        color: Theme.of(context).brightness == Brightness.dark
            ? ThemeColors.black
            : ThemeColors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(kPadding),
              child: Text(Translator.appName,
                  style: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? ThemeColors.white
                          : ThemeColors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 18)),
            ),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTapDown: (details) {
                  controller.openAvatarMenu(context, details);
                },
                child: Container(
                  width: 300,
                  padding: const EdgeInsets.symmetric(
                      horizontal: kPadding, vertical: kPaddingS),
                  child: Row(
                    spacing: kSpacingL,
                    children: [
                      Obx(
                        () => controller.user.value == null
                            ? CircleAvatar(
                                backgroundColor: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? ThemeColors.black
                                    : ThemeColors.lightBlue,
                                child: const Icon(HugeIcons.strokeRoundedUser),
                              )
                            : CircleAvatar(
                                backgroundImage: controller
                                            .user.value!.localImage.value !=
                                        null
                                    ? FileImage(
                                        controller.user.value!.localImage.value!)
                                    : null,
                              ),
                      ),
                      Obx(
                        () => Text(controller.user.value?.name ?? "",
                            style: TextStyle(
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? ThemeColors.white
                                    : ThemeColors.black,
                                fontSize: 18)),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
