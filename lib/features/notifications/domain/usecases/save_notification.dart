import 'package:appointments_manager/core/abstractions/usecases.dart';
import '../../data/respositories/notification_repository_impl.dart';
import '../entities/notification.dart';

class SaveNotificationUseCase extends UseCase<void> {
  late final NotificationRepositoryImpl _notificationRepository;
  final String body;
  SaveNotificationUseCase(this.body,  {NotificationRepositoryImpl? notificationRepository}) {
    _notificationRepository = notificationRepository ?? NotificationRepositoryImpl.to;
  }
  @override
  Future<void> perform() async {
    final notification = NotificationEntity(
      lastUpdate: DateTime.now(),
      notificationText: body,
      scheduledTime: DateTime.now(),
    );
    await _notificationRepository.saveNotification(notification);
  }
}