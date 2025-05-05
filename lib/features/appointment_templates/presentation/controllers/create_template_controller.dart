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

  CreateTemplateController(){
    sliderValue=RxDouble(1);
    selectedDurationString=RxString("");
    selectedDuration=RxInt(1);
  }

  @override
  void onInit() {
    setDuration(sliderValue.toInt());
    ever(
      sliderValue,
          (callback) => setDuration(callback.toInt()),
    );
    super.onInit();
  }

  void setDuration(int index) {
    selectedDurationString.value =
    durationTextMap[intToDuration[index]!.inMinutes]!;
  }

  void addField() {
    fields.add(FieldEntity(
      title: "",
    ));
  }
}
