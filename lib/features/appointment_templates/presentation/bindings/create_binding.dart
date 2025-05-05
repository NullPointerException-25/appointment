import 'package:appointments_manager/features/appointment_templates/presentation/controllers/create_template_controller.dart';
import 'package:get/get.dart';

class CreateTemplateBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(()=> CreateTemplateController());
  }
}