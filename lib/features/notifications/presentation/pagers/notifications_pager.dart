import 'package:appointments_manager/core/utils/colors.dart';
import 'package:appointments_manager/core/utils/fonts.dart';
import 'package:appointments_manager/core/utils/global_values.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class NotificationsPager extends StatelessWidget {
  const NotificationsPager({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(kPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Notifications", style: TextStyle(
                  fontSize: kFontSizeL,
                  fontFamily: FontFamily.montserrat,
                  fontWeight: FontWeight.w700
                ),),
                Icon(
                  HugeIcons.strokeRoundedNotification01,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? ThemeColors.white
                      : ThemeColors.dark,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
