import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

class BackgroundNotificationsService extends GetxService {
  static BackgroundNotificationsService get to => Get.find();

  Future<void> requestNotificationsPermission() async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    final result = await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();

    if (result != true) {
      throw Exception('Notifications permission not granted');
    }
  }

  @override
  void onInit() {
    requestNotificationsPermission();
    super.onInit();
  }
}
