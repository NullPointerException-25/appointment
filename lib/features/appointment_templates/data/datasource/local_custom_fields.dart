import 'package:appointments_manager/features/appointment/data/models/appointment.dart';
import 'package:appointments_manager/features/appointment_templates/data/model/appointment_field.dart';
import 'package:get/get.dart';

import '../../../../core/services/object_box_service.dart';
import '../../../../objectbox.g.dart';

class LocalCustomFieldsDataSource extends GetxService {
  static LocalCustomFieldsDataSource get to => Get.find<LocalCustomFieldsDataSource>();
  late final Rx<Store> _store;

  LocalCustomFieldsDataSource({ObjectBoxService? objectBoxService}) {
    _store = objectBoxService?.store ?? ObjectBoxService.to.store;
  }

  void attachCustomFields(AppointmentModel appointment, List<AppointmentFieldModel> customFields) {
    final box = _store.value.box<AppointmentModel>();
    final appointmentModel = box.get(appointment.localId);
    if (appointmentModel != null) {
      appointmentModel.fields.addAll(customFields);
      box.put(appointmentModel);
    }
  }

  void removeCustomField(AppointmentModel appointment, AppointmentFieldModel customField) {
    final box = _store.value.box<AppointmentModel>();
    final appointmentModel = box.get(appointment.localId);
    if (appointmentModel != null) {
      appointmentModel.fields.remove(customField);
      box.put(appointmentModel);
    }
  }

  List<AppointmentFieldModel> getCustomFields(AppointmentModel appointment) {
    final box = _store.value.box<AppointmentModel>();
    final appointmentModel = box.get(appointment.localId);
    return appointmentModel?.fields.toList() ?? [];
  }


}