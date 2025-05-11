

import 'package:appointments_manager/features/notifications/domain/entities/notification.dart';
import 'package:get/get.dart';

abstract class NotificationsRepository {

  Future<bool> requestNotificationsPermission();

  Rx<bool> get notificationsEnabled;

  Future<void> saveNotification(NotificationEntity notification);

  Future<List<NotificationEntity>> getRecentNotificationsBeforeDate(DateTime time);






}