import 'package:appointments_manager/features/appointment/presentation/controllers/create_appointment_controller.dart';
import 'package:appointments_manager/features/appointment_templates/presentation/controllers/custom_fields_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class CreateAppointmentBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>CreateAppointmentController());
    Get.lazyPut(()=>CustomFieldsController());
  }
}