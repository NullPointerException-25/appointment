import 'package:appointments_manager/home/presentation/controllers/home_controller.dart';
import 'package:appointments_manager/core/utils/colors.dart';
import 'package:appointments_manager/core/utils/translations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../core/utils/global_values.dart';

class HomeAppBar extends GetView<HomeController> {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? ThemeColors.black
          : ThemeColors.white,
      title: Text(Translator.appName,
          style: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark
                  ? ThemeColors.white
                  : ThemeColors.black,
              fontSize: 18)),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: kPadding),
          child: Obx(
            () => controller.user.value == null
                ? CircleAvatar(
                    backgroundColor:
                        Theme.of(context).brightness == Brightness.dark
                            ? ThemeColors.black
                            : ThemeColors.lightBlue,
                    child: IconButton(
                      icon: const Icon(HugeIcons.strokeRoundedUser),
                      onPressed: () {},
                      color: ThemeColors.darkBlue,
                    ),
                  )
                : CircleAvatar(
                    backgroundImage: controller.user.value!.localImage.value != null
                        ? FileImage(controller.user.value!.localImage.value!)
                        : null,
                  ),
          ),
        ),
      ],
    );
  }
}
