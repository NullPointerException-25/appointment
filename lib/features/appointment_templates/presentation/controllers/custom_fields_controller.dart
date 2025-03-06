import 'package:appointments_manager/features/appointment_templates/domain/entities/appointment_field_entity.dart';
import 'package:get/get.dart';

class CustomFieldsController extends GetxController {

  static CustomFieldsController get to => Get.find<CustomFieldsController>();

  final customFields = RxList<AppointmentFieldEntity>([]);

  void addNewField() {
    customFields.add(AppointmentFieldEntity(
      title: "",
    ));
  }


  void _removeField(AppointmentFieldEntity field) {
    customFields.remove(field);
  }

}