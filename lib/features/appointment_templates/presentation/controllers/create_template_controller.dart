import 'package:appointments_manager/features/appointment_templates/domain/entities/field.dart';
import 'package:get/get.dart';

import '../../domain/contracts/slidable_controller.dart';

class CreateTemplateController extends SlidableController {
  static CreateTemplateController get to =>
      Get.find<CreateTemplateController>();
  final RxString templateName = ''.obs;
  final RxString templateDescription = ''.obs;
  final RxString templateDuration = ''.obs;
  final RxList<FieldEntity> fields = <FieldEntity>[].obs;

  void addField() {
    fields.add(FieldEntity(
      title: "",
    ));
  }
}
