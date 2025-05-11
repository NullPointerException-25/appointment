import 'dart:io';

import 'package:get/get.dart';

import '../../../../core/services/background_notifications_service.dart';
import '../../../../core/services/object_box_service.dart';

class LocalNotificationsDatasource extends GetxService {
  static LocalNotificationsDatasource get to => Get.find();
  late final ObjectBoxService _objectBoxService;
  final Rx<bool> _notificationsEnabled = false.obs;

  LocalNotificationsDatasource({ObjectBoxService? objectBoxService}) {
    _objectBoxService = objectBoxService ?? ObjectBoxService.to;
  }

  Future<void> requestNotificationsPermission() async {
   switch (Platform.operatingSystem){
     case 'android':
       await BackgroundNotificationsService.to.androidRequestPermission();
       break;
     case 'ios':
       await BackgroundNotificationsService.to.iosRequestPermission();
       break;
     case 'macos':
       await BackgroundNotificationsService.to.macOsRequestPermission();
       break;
   }
  }

}

