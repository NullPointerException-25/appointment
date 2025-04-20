import 'package:appointments_manager/core/abstractions/entity.dart';
import 'package:appointments_manager/features/appointment_templates/data/model/appointment_custom_field_answer.dart';
import 'package:appointments_manager/features/appointment_templates/mappers/custom_field_answer_mapper.dart';

import '../../../../core/utils/global_values.dart';
import '../../../../objectbox.g.dart';

class AppointmentCustomFieldAnswerEntity<T> extends CoreEntity<AppointmentCustomFieldAnswerModel> {

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

  AppointmentCustomFieldAnswerEntity({
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
  AppointmentCustomFieldAnswerModel toModel() {
    return CustomFieldAnswerMapper.mapToModel(this);
  }


}