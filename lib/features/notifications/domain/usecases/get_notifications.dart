import 'package:appointments_manager/core/abstractions/usecases.dart';
import 'package:appointments_manager/features/notifications/domain/entities/notification.dart';

import '../../data/respositories/notification_repository_impl.dart';

class GetNotificationsUseCase extends UseCase<List<NotificationEntity>> {
  late final NotificationRepositoryImpl _repository;
  final DateTime time;
  GetNotificationsUseCase(this.time, {NotificationRepositoryImpl? repository}){
    _repository = repository ?? NotificationRepositoryImpl.to;
  }
  @override
  Future<List<NotificationEntity>> perform() async  {
    final notifications = await _repository.getRecentNotificationsBeforeDate(time);
    return notifications;
  }
}