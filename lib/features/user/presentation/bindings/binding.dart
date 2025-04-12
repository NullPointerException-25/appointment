import 'package:appointments_manager/features/user/presentation/controllers/login_controller.dart';
import 'package:get/get.dart';

import '../controllers/setup_controller.dart';

class SetupBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>LoginController());
    Get.lazyPut(()=>SetupController());

  }

}