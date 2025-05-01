import 'package:appointments_manager/core/abstractions/entity.dart';
import 'package:appointments_manager/features/appointment_templates/data/model/field_answer.dart';
import 'package:appointments_manager/features/appointment_templates/mappers/field_answer_mapper.dart';

import '../../../../core/utils/global_values.dart';
import '../../../../objectbox.g.dart';

class FieldAnswerEntity<T> extends CoreEntity<FieldAnswerModel> {

  @override
  @Id()
  int localId;
  @override
  final String remoteId;
  @override
  @Property(type: PropertyType.date)
  late DateTime lastUpdate;
  late FormFieldType formFieldType;
  T value;
  T? remoteValue;

  FieldAnswerEntity({
    this.localId = 0,
    this.remoteId = "",
    required this.formFieldType,
    required this.value,
    this.remoteValue,
    DateTime? lastUpdate,
  }) {
    this.lastUpdate = lastUpdate ?? DateTime.now();
  }

  @override
  FieldAnswerModel toModel() {
    return FieldAnswerMapper.mapToModel(this);
  }


}