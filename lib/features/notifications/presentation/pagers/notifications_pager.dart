import 'package:appointments_manager/core/utils/colors.dart';
import 'package:appointments_manager/core/utils/fonts.dart';
import 'package:appointments_manager/core/utils/global_values.dart';
import 'package:appointments_manager/features/notifications/domain/entities/notification.dart';
import 'package:appointments_manager/features/notifications/presentation/controllers/notifications_controller.dart';
import 'package:appointments_manager/features/notifications/presentation/widgets/enable_notifications_banner.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:jiffy/jiffy.dart';

class NotificationsPager extends GetView<NotificationsController> {
  const NotificationsPager({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kPadding),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Notifications",
                  style: TextStyle(
                      fontSize: kFontSizeL,
                      fontFamily: FontFamily.montserrat,
                      fontWeight: FontWeight.w700),
                ),
                Icon(
                  HugeIcons.strokeRoundedNotification01,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? ThemeColors.white
                      : ThemeColors.dark,
                )
              ],
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: kPaddingM,
            ),
          ),
         // const SliverToBoxAdapter(child: EnableNotificationsBanner()),
          ObxValue<RxList<NotificationEntity>>(
              (notifications) => SliverList.builder(
                    itemCount: notifications.length,
                    itemBuilder: (context, index) {
                      final notification = notifications[index];
                      return Container(
                        margin: EdgeInsets.only(
                            bottom: kPadding,
                            top: index == 0 ? kPaddingM : 0,
                            right: kPaddingS,
                            left: kPaddingS),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? ThemeColors.black
                                  : ThemeColors.darkGrey,
                              blurRadius: 2,
                              spreadRadius: 0,
                              offset: const Offset(0, 1),
                            ),
                          ],
                          color: Theme.of(context).brightness == Brightness.dark
                              ? ThemeColors.dark
                              : ThemeColors.white,
                          borderRadius: BorderRadius.circular(kCornerRadiusM),
                        ),
                        child: ListTile(
                          leading: Icon(
                            HugeIcons.strokeRoundedNotification01,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? ThemeColors.white
                                    : ThemeColors.dark,
                          ),
                          title: Text(
                            notification.title,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: kFontSizeL,
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? ThemeColors.white
                                  : ThemeColors.dark,
                            ),
                          ),
                          subtitle: Text(notification.notificationText,
                              style: TextStyle(
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? ThemeColors.white
                                    : ThemeColors.dark,
                              )),
                          trailing: Text(
                            Jiffy.parse(notification.scheduledTime
                                    .toIso8601String())
                                .Hm,
                            style: TextStyle(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? ThemeColors.white
                                  : ThemeColors.dark,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
              controller.notifications)
        ],
      ),
    );
  }
}
