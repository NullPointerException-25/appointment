import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../../core/services/background_notifications_service.dart';
import '../../../../core/services/object_box_service.dart';
import '../../../../objectbox.g.dart';
import '../models/notification_model.dart';

class LocalNotificationsDatasource extends GetxService {
  static LocalNotificationsDatasource get to => Get.find();
  late final ObjectBoxService _objectBoxService;
  final Rx<bool> _notificationsEnabled = false.obs;

  LocalNotificationsDatasource({ObjectBoxService? objectBoxService}) {
    _objectBoxService = objectBoxService ?? ObjectBoxService.to;
  }

  Future<bool> requestNotificationsPermission() async {
    if (kIsWeb) {
      return false;
    }
    switch (Platform.operatingSystem) {
      case 'android':
        return await BackgroundNotificationsService.to
            .androidRequestPermission();
      case 'ios':
        return await BackgroundNotificationsService.to.iosRequestPermission();
      case 'macos':
        return await BackgroundNotificationsService.to.macOsRequestPermission();
      case 'windows':
        return false;
      default:
        return false;
    }
  }

  Rx<bool> get notificationsEnabled => _notificationsEnabled;

  Future<void> saveNotification(NotificationModel notification) async {
    if (await requestNotificationsPermission()) {
      BackgroundNotificationsService.to.setScheduleNotification(
          notification.title, notification.notificationText, DateTime.now());
    }
    final box = _objectBoxService.store.value?.box<NotificationModel>();
    if (box != null) {
      box.put(notification);
    }
  }

  Future<List<NotificationModel>> getRecentNotificationsBeforeDate(
      DateTime time) async {
    final box = _objectBoxService.store.value?.box<NotificationModel>();
    if (box != null) {
      return box
          .query(NotificationModel_.scheduledTime
              .lessThan(time.millisecondsSinceEpoch))
          .order(NotificationModel_.scheduledTime, flags: Order.descending)
          .build()
          .find();
    }
    return [];
  }
}
