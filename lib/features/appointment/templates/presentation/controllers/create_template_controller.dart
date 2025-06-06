
import 'package:get/get.dart';

import '../../domain/contracts/slidable_controller.dart';
import '../../domain/entities/field.dart';
import '../../domain/entities/template.dart';
import '../../domain/usecases/save_template.dart';

class CreateTemplateController extends SlidableController {
  static CreateTemplateController get to =>
      Get.find<CreateTemplateController>();
  final RxString templateName = ''.obs;
  final RxList<FieldEntity> fields = <FieldEntity>[].obs;
  final RxBool durationSliderEnabled = true.obs;

  CreateTemplateController() {
    sliderValue = RxDouble(1);
    selectedDurationString = RxString("");
    selectedDuration = RxInt(1);
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

  void createTemplate() async {
    final AppointmentTemplateEntity template = AppointmentTemplateEntity(
      name: templateName.value,
      duration: durationSliderEnabled.value ? sliderValue.value.toInt() : null,
    );
    await SaveTemplateUseCase(template, fields).perform();
  }
}
