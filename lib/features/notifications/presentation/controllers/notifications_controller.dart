import 'package:appointments_manager/features/notifications/domain/entities/notification.dart';
import 'package:get/get.dart';

import '../../domain/usecases/get_notifications.dart';

class NotificationsController extends GetxController {
  static NotificationsController get to => Get.find<NotificationsController>();

  final Rx<bool> _notificationsEnabled = true.obs;
  final RxList<NotificationEntity> _notifications = <NotificationEntity>[].obs;

  Rx<bool> get notificationsEnabled => _notificationsEnabled;

  RxList<NotificationEntity> get notifications => _notifications;

  @override
  void onInit() {
    requestNotificationsPermission();
    getRecentNotificationsBeforeDate();
    super.onInit();
    // Initialize notifications settings or any other setup needed
  }

  Future<void> requestNotificationsPermission() async {}

  Future<void> getRecentNotificationsBeforeDate() async {
    _notifications.value =
        await GetNotificationsUseCase(DateTime.now()).perform();
  }
}
