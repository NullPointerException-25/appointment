import 'package:appointments_manager/features/appointment/data/models/appointment.dart';
import 'package:appointments_manager/features/appointment_templates/data/datasource/local_custom_fields.dart';
import 'package:appointments_manager/features/appointment_templates/data/model/appointment_field.dart';
import 'package:appointments_manager/features/appointment_templates/domain/entities/appointment_template_entity.dart';
import 'package:appointments_manager/features/appointment_templates/domain/repositories/appointment_custom_fields_repository.dart';
import 'package:get/get.dart';

class LocalCustomFieldsRepositoryImpl extends GetxService implements AppointmentCustomFieldsRepository {
  late final LocalCustomFieldsDataSource _localCustomFieldsDataSource;

  static LocalCustomFieldsRepositoryImpl get to => Get.find<LocalCustomFieldsRepositoryImpl>();

  LocalCustomFieldsRepositoryImpl({LocalCustomFieldsDataSource? localCustomFieldsDataSource}) {
    _localCustomFieldsDataSource = localCustomFieldsDataSource ?? LocalCustomFieldsDataSource.to;
  }

  @override
  Future<void> attachCustomFields(AppointmentModel appointment, List<AppointmentFieldModel> customFields) async {
    _localCustomFieldsDataSource.attachCustomFields(appointment, customFields);
    return;
  }

  @override
  Future<List<AppointmentFieldModel>> getCustomFields(AppointmentModel appointment) async {
    return _localCustomFieldsDataSource.getCustomFields(appointment);
  }

  @override
  Future<List<AppointmentFieldModel>> getCustomFieldsByTemplate(AppointmentTemplateEntity template) {
    // TODO: implement getCustomFieldsByTemplate
    throw UnimplementedError();
  }

  @override
  Future<void> removeCustomField(AppointmentModel appointment, AppointmentFieldModel customField) async {
      _localCustomFieldsDataSource.removeCustomField(appointment, customField);
  }


}