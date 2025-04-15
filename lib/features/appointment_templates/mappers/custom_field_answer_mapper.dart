import 'package:appointments_manager/features/appointment_templates/data/model/appointment_custom_field_answer.dart';

import '../../../core/utils/global_values.dart';
import '../domain/entities/appointment_custom_field_answer.dart';

class CustomFieldAnswerMapper {
  static AppointmentCustomFieldAnswerModel mapToModel(
      AppointmentCustomFieldAnswerEntity entity) {
    return AppointmentCustomFieldAnswerModel(
      localId: entity.localId,
      remoteId: entity.remoteId,
      formFieldType:         formFieldTypeMap.entries
          .firstWhere((element) => element.value == element.value)
          .key,
      lastUpdate: entity.lastUpdate,
    );
  }

  static AppointmentCustomFieldAnswerEntity mapToEntity(
      AppointmentCustomFieldAnswerModel model) {
    final type =  formFieldTypeMap[model.formFieldType] ?? FormFieldType.unknown;
    switch(type) {
      case FormFieldType.largeText:
        return AppointmentCustomFieldAnswerEntity<String>(
          localId: model.localId,
          remoteId: model.remoteId,
          lastUpdate: model.lastUpdate,
          formFieldType: type,
          value: model.textValue,
        );
      case FormFieldType.number:
        return AppointmentCustomFieldAnswerEntity<int>(
          localId: model.localId,
          remoteId: model.remoteId,
          lastUpdate: model.lastUpdate,
          formFieldType: type,
          value: model.numberValue,
        );
      case FormFieldType.date:
        return AppointmentCustomFieldAnswerEntity<DateTime>(
          localId: model.localId,
          remoteId: model.remoteId,
          lastUpdate: model.lastUpdate,
          formFieldType: type,
          value: model.dateValue,
        );

      case FormFieldType.shortText:
        return AppointmentCustomFieldAnswerEntity<String>(
          localId: model.localId,
          remoteId: model.remoteId,
          lastUpdate: model.lastUpdate,
          formFieldType: type,
          value: model.textValue,
        );
      case FormFieldType.imageList:

        return AppointmentCustomFieldAnswerEntity<List<String>>(
          localId: model.localId,
          remoteId: model.remoteId,
          lastUpdate: model.lastUpdate,
          formFieldType: type,
          value: model.localDocs,
        );

      case FormFieldType.phoneNumber:
        return AppointmentCustomFieldAnswerEntity<int>(
          localId: model.localId,
          remoteId: model.remoteId,
          lastUpdate: model.lastUpdate,
          formFieldType: type,
          value: model.numberValue,
        );
      case FormFieldType.audio:
        return AppointmentCustomFieldAnswerEntity<String>(
          localId: model.localId,
          remoteId: model.remoteId,
          lastUpdate: model.lastUpdate,
          formFieldType: type,
          value: model.textValue,
        );
      default:
        return AppointmentCustomFieldAnswerEntity(
          localId: model.localId,
          remoteId: model.remoteId,
          lastUpdate: model.lastUpdate,
          formFieldType: type,
          value: "",
        );
    }
  }
}