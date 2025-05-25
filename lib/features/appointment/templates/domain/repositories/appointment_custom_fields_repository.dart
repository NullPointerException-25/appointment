import 'package:appointments_manager/features/appointment/data/models/appointment.dart';

import '../../data/model/field.dart';
import '../entities/template.dart';

abstract class AppointmentCustomFieldsRepository {
  Future<void> attachCustomFields(AppointmentModel appointment, List<FieldModel> customFields);
  Future<List<FieldModel>> getCustomFields(AppointmentModel appointment);
  Future<List<FieldModel>> getCustomFieldsByTemplate(AppointmentTemplateEntity template);
  Future<void> removeCustomField(AppointmentModel appointment, FieldModel customField);

}