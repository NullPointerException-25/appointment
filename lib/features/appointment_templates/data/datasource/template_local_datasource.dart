import 'package:appointments_manager/features/appointment_templates/data/model/template.dart';
import 'package:get/get.dart';

import '../../../../core/services/object_box_service.dart';
import '../model/field.dart';

class TemplateLocalDatasource extends GetxService {
  late final ObjectBoxService _objectBoxService;

  static TemplateLocalDatasource get to => Get.find<TemplateLocalDatasource>();


  TemplateLocalDatasource({ObjectBoxService? objectBoxService}){
    _objectBoxService = objectBoxService ?? ObjectBoxService.to;
  }
  int saveTemplate(AppointmentTemplateModel template){
    final box = _objectBoxService.store.value!.box<AppointmentTemplateModel>();
    return box.put(template);
  }

  void attachFieldsToTemplate(AppointmentTemplateModel template, List<FieldModel> fields){
    final box = _objectBoxService.store.value!.box<AppointmentTemplateModel>();
    final templateModel = box.get(template.localId);
    if(templateModel==null){
      return;
    }
    final fieldsBox = _objectBoxService.store.value!.box<FieldModel>();
    for(final field in fields){
      fieldsBox.put(field);
      templateModel.fields.add(field);
    }
    box.put(templateModel);
  }

  Future<List<AppointmentTemplateModel>> getAllTemplates() async {
    final templateBox = _objectBoxService.store.value!.box<AppointmentTemplateModel>();
    return templateBox.getAll();

  }

  Future<void> deleteTemplate(AppointmentTemplateModel templateModel) async {
    final templateBox = _objectBoxService.store.value!.box<AppointmentTemplateModel>();
    templateBox.remove(templateModel.localId);
  }

}