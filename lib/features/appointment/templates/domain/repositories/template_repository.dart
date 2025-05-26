

import '../entities/field.dart';
import '../entities/template.dart';

abstract class TemplateRepository{
  Future<AppointmentTemplateEntity> saveTemplate(AppointmentTemplateEntity template);
  Future<void> deleteTemplate(AppointmentTemplateEntity template);
  Future<List<AppointmentTemplateEntity>> getAllTemplates();
  Future<AppointmentTemplateEntity?> getTemplateById(int id);
  Future<void> updateTemplate(AppointmentTemplateEntity template);
  Future<void> attachFieldsToTemplate(AppointmentTemplateEntity template, List<FieldEntity> fields);
}