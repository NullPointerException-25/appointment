import 'package:appointments_manager/features/appointment/data/models/appointment.dart';
import 'package:appointments_manager/features/appointment_templates/data/model/appointment_field.dart';
import 'package:appointments_manager/features/appointment_templates/domain/entities/appointment_template_entity.dart';

abstract class AppointmentCustomFieldsRepository {
  Future<void> attachCustomFields(AppointmentModel appointment, List<AppointmentFieldModel> customFields);
  Future<List<AppointmentFieldModel>> getCustomFields(AppointmentModel appointment);
  Future<List<AppointmentFieldModel>> getCustomFieldsByTemplate(AppointmentTemplateEntity template);
  Future<void> removeCustomField(AppointmentModel appointment, AppointmentFieldModel customField);

}