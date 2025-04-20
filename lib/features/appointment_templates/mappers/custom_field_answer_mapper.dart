import 'package:appointments_manager/features/appointment_templates/data/model/appointment_custom_field_answer.dart';
import 'package:appointments_manager/features/appointment_templates/domain/entities/appointment_field_entity.dart';

import '../../../core/utils/global_values.dart';
import '../domain/entities/appointment_custom_field_answer.dart';

class CustomFieldAnswerMapper {
  static AppointmentCustomFieldAnswerModel mapToModel(
      AppointmentCustomFieldAnswerEntity entity) {
    final type = formFieldTypeMap.entries
        .firstWhere((element) => element.value == entity.formFieldType)
        .key;
    final formFieldType = formFieldTypeMap[type] ?? FormFieldType.unknown;
    switch (formFieldType) {
      case FormFieldType.largeText:
        return AppointmentCustomFieldAnswerModel(
          localId: entity.localId,
          remoteId: entity.remoteId,
          lastUpdate: entity.lastUpdate,
          formFieldType: type,
          textValue: entity.value as String,
        );
      case FormFieldType.number:
        return AppointmentCustomFieldAnswerModel(
          localId: entity.localId,
          remoteId: entity.remoteId,
          lastUpdate: entity.lastUpdate,
          formFieldType: type,
          numberValue: entity.value as int,
        );
      case FormFieldType.date:
        return AppointmentCustomFieldAnswerModel(
          localId: entity.localId,
          remoteId: entity.remoteId,
          lastUpdate: entity.lastUpdate,
          formFieldType: type,
          dateValue: entity.value as DateTime,
        );

      case FormFieldType.shortText:
        return AppointmentCustomFieldAnswerModel(
          localId: entity.localId,
          remoteId: entity.remoteId,
          lastUpdate: entity.lastUpdate,
          formFieldType: type,
          textValue: entity.value as String,
        );
      case FormFieldType.imageList:
        return AppointmentCustomFieldAnswerModel(
          localId: entity.localId,
          remoteId: entity.remoteId,
          lastUpdate: entity.lastUpdate,
          formFieldType: type,
          localDocs: List<String>.from(entity.value as List),
          remoteDocs: List<String>.from(entity.remoteValue as List),
        );

      case FormFieldType.phoneNumber:
        return AppointmentCustomFieldAnswerModel(
          localId: entity.localId,
          remoteId: entity.remoteId,
          lastUpdate: entity.lastUpdate,
          formFieldType: type,
          numberValue: entity.value as int,
        );
      case FormFieldType.audio:
        return AppointmentCustomFieldAnswerModel(
          localId: entity.localId,
          remoteId: entity.remoteId,
          lastUpdate: entity.lastUpdate,
          formFieldType: type,
          singleDoc: entity.value as String,
          singleDocUrl: entity.remoteValue as String? ?? "",
        );
      default:
        return AppointmentCustomFieldAnswerModel(
            localId: 0, remoteId: "", formFieldType: type);
    }
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
          remoteValue: model.remoteDocs,
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
          value: model.singleDoc,
          remoteValue: model.singleDocUrl
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

  static AppointmentCustomFieldAnswerEntity defaultAnswer(AppointmentFieldEntity field){
    final type =  field.fieldType;
    switch (type){
      case FormFieldType.largeText:
        return AppointmentCustomFieldAnswerEntity<String>(
          localId: field.localId,
          remoteId: field.remoteId,
          lastUpdate: field.lastUpdate,
          formFieldType: type,
          value: "",
        );
      case FormFieldType.number:
        return AppointmentCustomFieldAnswerEntity<int>(
          localId: field.localId,
          remoteId: field.remoteId,
          lastUpdate: field.lastUpdate,
          formFieldType: type,
          value: 0,
        );
      case FormFieldType.date:
        return AppointmentCustomFieldAnswerEntity<DateTime>(
          localId: field.localId,
          remoteId: field.remoteId,
          lastUpdate: field.lastUpdate,
          formFieldType: type,
          value: DateTime.now(),
        );

      case FormFieldType.shortText:
        return AppointmentCustomFieldAnswerEntity<String>(
          localId: field.localId,
          remoteId: field.remoteId,
          lastUpdate: field.lastUpdate,
          formFieldType: type,
          value: "",
        );
      case FormFieldType.imageList:

        return AppointmentCustomFieldAnswerEntity<List<String>>(
          localId: field.localId,
          remoteId: field.remoteId,
          lastUpdate: field.lastUpdate,
          formFieldType: type,
          value: [],
          remoteValue: []
        );

      case FormFieldType.phoneNumber:
        return AppointmentCustomFieldAnswerEntity<int>(
          localId: field.localId,
          remoteId: field.remoteId,
          lastUpdate: field.lastUpdate,
          formFieldType: type,
          value: 0,
        );
      case FormFieldType.audio:
        return AppointmentCustomFieldAnswerEntity<String>(
            localId: field.localId,
            remoteId: field.remoteId,
            lastUpdate: field.lastUpdate,
            formFieldType: type,
            value: "",
            remoteValue:""
        );

      case FormFieldType.unknown:
        return AppointmentCustomFieldAnswerEntity(
            localId: 0, remoteId:"", formFieldType:type, value:"");
    }

  }
}