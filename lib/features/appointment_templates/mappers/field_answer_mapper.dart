import 'package:appointments_manager/features/appointment_templates/data/model/field_answer.dart';
import 'package:appointments_manager/features/appointment_templates/domain/entities/field.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/utils/global_values.dart';
import '../domain/entities/field_answer.dart';


class FieldAnswerMapper {
  static FieldAnswerModel mapToModel(
      FieldAnswerEntity entity) {
    final type = formFieldTypeMap.entries
        .firstWhere((element) => element.value == entity.formFieldType)
        .key;
    final formFieldType = formFieldTypeMap[type] ?? FormFieldType.unknown;
    switch (formFieldType) {
      case FormFieldType.largeText:
        return FieldAnswerModel(
          localId: entity.localId,
          remoteId: entity.remoteId,
          lastUpdate: entity.lastUpdate,
          formFieldType: type,
          textValue: entity.value as String,
        );
      case FormFieldType.number:
        debugPrint("numberValue: ${entity.value}");
        final aux=  FieldAnswerModel(
          localId: entity.localId,
          remoteId: entity.remoteId,
          lastUpdate: entity.lastUpdate,
          formFieldType: type,
          numberValue: int.tryParse(entity.value.toString()) ?? 10,
        );
          debugPrint("numberValue: ${aux.numberValue}");
          return aux;
      case FormFieldType.date:
        return FieldAnswerModel(
          localId: entity.localId,
          remoteId: entity.remoteId,
          lastUpdate: entity.lastUpdate,
          formFieldType: type,
          dateValue: entity.value as DateTime,
        );

      case FormFieldType.shortText:
        return FieldAnswerModel(
          localId: entity.localId,
          remoteId: entity.remoteId,
          lastUpdate: entity.lastUpdate,
          formFieldType: type,
          textValue: entity.value as String,
        );
      case FormFieldType.imageList:
        return FieldAnswerModel(
          localId: entity.localId,
          remoteId: entity.remoteId,
          lastUpdate: entity.lastUpdate,
          formFieldType: type,
          localDocs: List<String>.from(entity.value as List),
          remoteDocs: List<String>.from(entity.remoteValue as List),
        );

      case FormFieldType.phoneNumber:
        return FieldAnswerModel(
          localId: entity.localId,
          remoteId: entity.remoteId,
          lastUpdate: entity.lastUpdate,
          formFieldType: type,
          numberValue: entity.value as int,
        );
      case FormFieldType.audio:
        return FieldAnswerModel(
          localId: entity.localId,
          remoteId: entity.remoteId,
          lastUpdate: entity.lastUpdate,
          formFieldType: type,
          singleDoc: entity.value as String,
          singleDocUrl: entity.remoteValue as String? ?? "",
        );
      default:
        return FieldAnswerModel(
            localId: 0, remoteId: "", formFieldType: type);
    }
  }

  static FieldAnswerEntity mapToEntity(
      FieldAnswerModel model) {
    final type =  formFieldTypeMap[model.formFieldType] ?? FormFieldType.unknown;
    switch(type) {
      case FormFieldType.largeText:
        return FieldAnswerEntity<String>(
          localId: model.localId,
          remoteId: model.remoteId,
          lastUpdate: model.lastUpdate,
          formFieldType: type,
          value: model.textValue,
        );
      case FormFieldType.number:
        debugPrint("numberValue: ${model.numberValue}");
       final aux=  FieldAnswerEntity<int>(
          localId: model.localId,
          remoteId: model.remoteId,
          lastUpdate: model.lastUpdate,
          formFieldType: type,
          value: model.numberValue,
        );
        return aux;
      case FormFieldType.date:
        return FieldAnswerEntity<DateTime>(
          localId: model.localId,
          remoteId: model.remoteId,
          lastUpdate: model.lastUpdate,
          formFieldType: type,
          value: model.dateValue,
        );

      case FormFieldType.shortText:
        return FieldAnswerEntity<String>(
          localId: model.localId,
          remoteId: model.remoteId,
          lastUpdate: model.lastUpdate,
          formFieldType: type,
          value: model.textValue,
        );
      case FormFieldType.imageList:

        return FieldAnswerEntity<List<String>>(
          localId: model.localId,
          remoteId: model.remoteId,
          lastUpdate: model.lastUpdate,
          formFieldType: type,
          value: model.localDocs,
          remoteValue: model.remoteDocs,
        );

      case FormFieldType.phoneNumber:
        return FieldAnswerEntity<int>(
          localId: model.localId,
          remoteId: model.remoteId,
          lastUpdate: model.lastUpdate,
          formFieldType: type,
          value: model.numberValue,
        );
      case FormFieldType.audio:
        return FieldAnswerEntity<String>(
          localId: model.localId,
          remoteId: model.remoteId,
          lastUpdate: model.lastUpdate,
          formFieldType: type,
          value: model.singleDoc,
          remoteValue: model.singleDocUrl
        );
      default:
        return FieldAnswerEntity(
          localId: model.localId,
          remoteId: model.remoteId,
          lastUpdate: model.lastUpdate,
          formFieldType: type,
          value: "",
        );
    }
  }

  static FieldAnswerEntity defaultAnswer(FieldEntity field){
    final type =  field.fieldType;
    switch (type){
      case FormFieldType.largeText:
        return FieldAnswerEntity<String>(
          localId: field.localId,
          remoteId: field.remoteId,
          lastUpdate: field.lastUpdate,
          formFieldType: type,
          value: "",
        );
      case FormFieldType.number:
        return FieldAnswerEntity<int>(
          localId: field.localId,
          remoteId: field.remoteId,
          lastUpdate: field.lastUpdate,
          formFieldType: type,
          value: 0,
        );
      case FormFieldType.date:
        return FieldAnswerEntity<DateTime>(
          localId: field.localId,
          remoteId: field.remoteId,
          lastUpdate: field.lastUpdate,
          formFieldType: type,
          value: DateTime.now(),
        );

      case FormFieldType.shortText:
        return FieldAnswerEntity<String>(
          localId: field.localId,
          remoteId: field.remoteId,
          lastUpdate: field.lastUpdate,
          formFieldType: type,
          value: "",
        );
      case FormFieldType.imageList:

        return FieldAnswerEntity<List<String>>(
          localId: field.localId,
          remoteId: field.remoteId,
          lastUpdate: field.lastUpdate,
          formFieldType: type,
          value: [],
          remoteValue: []
        );

      case FormFieldType.phoneNumber:
        return FieldAnswerEntity<int>(
          localId: field.localId,
          remoteId: field.remoteId,
          lastUpdate: field.lastUpdate,
          formFieldType: type,
          value: 0,
        );
      case FormFieldType.audio:
        return FieldAnswerEntity<String>(
            localId: field.localId,
            remoteId: field.remoteId,
            lastUpdate: field.lastUpdate,
            formFieldType: type,
            value: "",
            remoteValue:""
        );

      case FormFieldType.unknown:
        return FieldAnswerEntity(
            localId: 0, remoteId:"", formFieldType:type, value:"");
    }

  }
}