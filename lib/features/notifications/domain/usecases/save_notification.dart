import 'package:appointments_manager/core/abstractions/usecases.dart';
import '../../data/respositories/notification_repository_impl.dart';
import '../entities/notification.dart';

class SaveNotificationUseCase extends UseCase<void> {
  late final NotificationRepositoryImpl _notificationRepository;
  final String body;
  final DateTime scheduledTime;
  SaveNotificationUseCase(this.body, this.scheduledTime,  {NotificationRepositoryImpl? notificationRepository}) {
    _notificationRepository = notificationRepository ?? NotificationRepositoryImpl.to;
  }
  @override
  Future<void> perform() async {
    final notification = NotificationEntity(
      lastUpdate: DateTime.now(),
      notificationText: body,
      scheduledTime: scheduledTime,
    );
    await _notificationRepository.saveNotification(notification);
  }
}