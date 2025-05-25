import 'package:appointments_manager/core/abstractions/entity.dart';


import '../../../../../core/utils/global_values.dart';

import '../../data/model/field.dart';
import '../../mappers/field_answer_mapper.dart';
import 'field_answer.dart';

class FieldEntity extends CoreEntity<FieldModel> {
  @override
  late DateTime lastUpdate;

  @override
  int localId;

  @override
  String remoteId;

  String title;

  late FormFieldType fieldType;

  FieldAnswerEntity? answer;

  FieldEntity(
      {DateTime? lastUpdate,
      this.localId = 0,
      this.remoteId = "",
      this.answer,
      required this.title,
      int fieldType = 1}) {
    this.lastUpdate = lastUpdate ?? DateTime.now();
    this.fieldType = formFieldTypeMap[fieldType] ?? FormFieldType.unknown;
  }

  @override
  FieldModel toModel() {
    return FieldModel(
        title,
        formFieldTypeMap.entries
            .firstWhere((element) => element.value == fieldType)
            .key,
        localId: localId,
        lastUpdate: lastUpdate,
        remoteId: remoteId)..answer.target= FieldAnswerMapper.mapToModel(answer!);
  }
}
