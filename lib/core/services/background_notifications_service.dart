import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import 'package:timezone/timezone.dart' as tz;

class BackgroundNotificationsService extends GetxService {
  static BackgroundNotificationsService get to => Get.find();
  late FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;
  late AndroidFlutterLocalNotificationsPlugin androidImplementation;
  late IOSFlutterLocalNotificationsPlugin iosImplementation;

  Future<void> _initPlugin() async {
     _flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    const DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings();
    const LinuxInitializationSettings initializationSettingsLinux =
        LinuxInitializationSettings(defaultActionName: 'Open notification');
    const WindowsInitializationSettings initializationSettingsWindows =
        WindowsInitializationSettings(
            appName: 'Appointments Manager',
            appUserModelId: 'com.sublimesoftwares.appointments_manager',
            // Search online for GUID generators to make your own
            guid: 'd49b0314-ee7a-4626-bf79-97cdb8a991bb');
    const InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsDarwin,
            macOS: initializationSettingsDarwin,
            linux: initializationSettingsLinux,
            windows: initializationSettingsWindows);
    await _flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: _onDidReceiveNotificationResponse);
  }

  void _onDidReceiveNotificationResponse(
      NotificationResponse notificationResponse) async {
    final String? payload = notificationResponse.payload;
    if (notificationResponse.payload != null) {
      debugPrint('notification payload: $payload');
    }
  }

  Future<bool> androidRequestPermission() async {
    final isGranted = await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.areNotificationsEnabled();
    if (isGranted != null && isGranted) {
      return true;
    }

    final result = await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();

    if (result == null || !result) {
      return false;
    }
    return true;
  }

  Future<bool> iosRequestPermission() async {
    final isGranted = await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.checkPermissions();
    if (isGranted == null || !isGranted.isEnabled) {
      return false;
    }
    final result = await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(badge: true);
    if (result == null || !result) {
      return false;
    }
    return true;
  }

  Future<bool> macOsRequestPermission() async {
    final result = await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            MacOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          badge: true,
        );
    if (result == null || !result) {
      return false;
    }
    return true;
  }

  @override
  void onInit() {
    _initPlugin();
    super.onInit();
  }

  Future<void> setScheduleNotification(
      String title, String body, DateTime date) async {
    var tzDateTime = tz.TZDateTime.from(date, tz.local);
    if(kDebugMode){
      tzDateTime = tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5));
    }
    debugPrint("Scheduling notification");
    await _flutterLocalNotificationsPlugin.zonedSchedule(
        date.millisecond,
        title,
        body,
        tzDateTime,
        const NotificationDetails(
            iOS: DarwinNotificationDetails(
              presentBadge: true,
            ),
            macOS: DarwinNotificationDetails(
              presentBadge: true,
            ),
            windows: WindowsNotificationDetails(),
            android: AndroidNotificationDetails(
                'notifications', 'appointments_manager',
                channelDescription: 'None')),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle);
  }
}
