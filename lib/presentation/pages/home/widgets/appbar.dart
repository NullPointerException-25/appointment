import 'package:appointments_manager/controllers/home/home_controller.dart';
import 'package:appointments_manager/utils/colors.dart';
import 'package:appointments_manager/utils/global_values.dart';
import 'package:appointments_manager/utils/translations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

class HomeAppBar extends GetView<HomeController> {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? ThemeColors.black
          : ThemeColors.lightBlue,
      title: Text(Translator.appName,
          style: const TextStyle(color: ThemeColors.white, fontSize: 18)),
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
              backgroundImage: controller.user.value!.file.value != null
                  ? FileImage(controller.user.value!.file.value!)
                  : null,
            ),
          ),
        ),
      ],
    );
  }

}
