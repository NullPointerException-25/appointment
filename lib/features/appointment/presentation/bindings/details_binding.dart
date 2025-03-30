import 'package:get/get.dart';

import '../controllers/details_appointment_controller.dart';

class DetailsAppointmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => DetailsAppointmentController(),
    );
  }
}
