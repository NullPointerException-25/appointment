import 'package:appointments_manager/core/abstractions/entity.dart';
import 'package:appointments_manager/features/notifications/data/models/notification_model.dart';

class NotificationEntity extends CoreEntity<NotificationModel> {
  @override
  final DateTime lastUpdate;

  @override
  final int localId;

  @override
  final String remoteId;

  final DateTime scheduledTime;

  String notificationText;
  String title;
  bool isRead;

  @override
  NotificationEntity(
      {required this.lastUpdate,
      this.localId = 0,
      this.remoteId = "",
      this.notificationText = '',
      this.title = '',
      this.isRead = false,
      required this.scheduledTime});

  @override
  NotificationModel toModel() {
    return NotificationModel(
        lastUpdate: lastUpdate,
        localId: localId,
        remoteId: remoteId,
        notificationText: notificationText,
        title: title,
        isRead: isRead,
        scheduledTime: scheduledTime);
  }
}
