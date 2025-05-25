import 'package:appointments_manager/features/notifications/data/datasources/local_notifications_datasource.dart';
import 'package:appointments_manager/features/notifications/domain/entities/notification.dart';
import 'package:get/get.dart';

import '../../domain/repositories/notifications_repository.dart';

class NotificationRepositoryImpl extends GetxService implements NotificationsRepository {
  static NotificationRepositoryImpl get to => Get.find<NotificationRepositoryImpl>();
  late final LocalNotificationsDatasource _localNotificationsDatasource;

  NotificationRepositoryImpl({LocalNotificationsDatasource? localNotificationsDatasource}) {
    _localNotificationsDatasource = localNotificationsDatasource ?? LocalNotificationsDatasource.to;
  }
  @override
  Future<List<NotificationEntity>> getRecentNotificationsBeforeDate(DateTime time) async  {
    final notifications = await _localNotificationsDatasource.getRecentNotificationsBeforeDate(time);
    return notifications.map((notification) => notification.toEntity()).toList();
  }

  @override
  Rx<bool> get notificationsEnabled => _localNotificationsDatasource.notificationsEnabled;

  @override
  Future<bool> requestNotificationsPermission() async {
    return await _localNotificationsDatasource.requestNotificationsPermission();
  }

  @override
  Future<void> saveNotification(NotificationEntity notification) async {
    final notificationModel = notification.toModel();
    return await _localNotificationsDatasource.saveNotification(notificationModel);
  }

}