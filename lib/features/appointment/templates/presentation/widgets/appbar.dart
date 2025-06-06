import 'package:appointments_manager/core/utils/colors.dart';
import 'package:appointments_manager/core/utils/translations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class TemplatesAppBar extends StatelessWidget {
  const TemplatesAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  SliverAppBar(
      floating: true,
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? ThemeColors.black
          : ThemeColors.white,
      title: Text(Translator.templates.tr,
          style: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark
                  ? ThemeColors.white
                  : ThemeColors.black,
              fontSize: 18)),
      actions: [

      ],
    );
  }
}
