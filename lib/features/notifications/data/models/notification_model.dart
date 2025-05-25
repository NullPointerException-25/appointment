import 'package:appointments_manager/core/abstractions/model.dart';

import 'package:objectbox/objectbox.dart';
import '../../domain/entities/notification.dart';

@Entity(uid: 8)
class NotificationModel extends CoreModel<NotificationEntity> {
  @override
  @Property(type: PropertyType.date)
  DateTime lastUpdate;

  @Property(type: PropertyType.date)
  DateTime scheduledTime;

  @override
  @Id()
  int localId;

  @override
  String remoteId;

  String notificationText;


  String title;
  bool isRead;

  NotificationModel({
    required this.lastUpdate,
    required this.localId,
    required this.remoteId,
    required this.scheduledTime,
    required this.notificationText,
    this.title = '',
    this.isRead = false,
  });

  @override
  NotificationEntity toEntity() {
    return NotificationEntity(
      lastUpdate: lastUpdate,
      localId: localId,
      remoteId: remoteId,
      scheduledTime: scheduledTime,
      notificationText: notificationText,
      title: title,
      isRead: isRead,
    );
  }

  @override
  toJson() {
    throw UnimplementedError();
  }
}
