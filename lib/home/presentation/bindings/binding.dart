import 'package:appointments_manager/home/presentation/controllers/home_controller.dart';
import 'package:appointments_manager/home/presentation/controllers/timeline_controller.dart';
import 'package:get/get.dart';

import '../../../features/notifications/presentation/controllers/notifications_controller.dart';
import '../controllers/plot_controller.dart';


class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<TimelineController>(() => TimelineController());
    Get.lazyPut<NotificationsController>(() => NotificationsController());
    Get.lazyPut<PlotController>(() => PlotController());
  }
}
