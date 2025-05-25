import 'package:appointments_manager/features/appointment/data/models/appointment.dart';
import 'package:get/get.dart';

import '../../../../../core/services/object_box_service.dart';
import '../model/field.dart';


class LocalCustomFieldsDataSource extends GetxService {
  static LocalCustomFieldsDataSource get to =>
      Get.find<LocalCustomFieldsDataSource>();
  late final ObjectBoxService _objectBoxService;

  LocalCustomFieldsDataSource({ObjectBoxService? objectBoxService}) {
    _objectBoxService = objectBoxService ?? ObjectBoxService.to;
  }

  void attachCustomFields(
      AppointmentModel appointment, List<FieldModel> customFields) {
    final box = _objectBoxService.store.value!.box<AppointmentModel>();
    final appointmentModel = box.get(appointment.localId);
    if (appointmentModel != null) {
      appointmentModel.fields.addAll(customFields);
      box.put(appointmentModel);
    }
  }

  void removeCustomField(
      AppointmentModel appointment, FieldModel customField) {
    final box = _objectBoxService.store.value!.box<AppointmentModel>();
    final appointmentModel = box.get(appointment.localId);
    if (appointmentModel != null) {
      appointmentModel.fields.remove(customField);
      box.put(appointmentModel);
    }
  }

  List<FieldModel> getCustomFields(AppointmentModel appointment) {
    final box = _objectBoxService.store.value!.box<AppointmentModel>();
    final appointmentModel = box.get(appointment.localId);
    return appointmentModel?.fields.toList() ?? [];
  }
}
