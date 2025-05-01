import 'package:appointments_manager/core/abstractions/model.dart';
import 'package:appointments_manager/features/appointment/data/models/appointment.dart';
import 'package:appointments_manager/features/appointment_templates/data/model/template.dart';
import 'package:appointments_manager/features/appointment_templates/domain/entities/field.dart';
import 'package:appointments_manager/features/appointment_templates/mappers/field_answer_mapper.dart';
import 'package:objectbox/objectbox.dart';

import 'field_answer.dart';

@Entity(uid: 6)
class FieldModel extends CoreModel<FieldEntity> {
  @override
  @Id()
  int localId;
  final String title;
  late int formFieldType;
  @override
  @Property(type: PropertyType.date)
  late DateTime lastUpdate;
  @override
  String remoteId;
  final appointment = ToOne<AppointmentModel>();
  final template = ToOne<AppointmentTemplateModel>();

  final answer = ToOne<FieldAnswerModel>();

  FieldModel(
    this.title,
    this.formFieldType, {
    this.localId = 0,
    this.remoteId = "",
    DateTime? lastUpdate,
  }) {
    this.lastUpdate = lastUpdate ?? DateTime.now();
  }

  @override
  FieldEntity toEntity() {
    return FieldEntity(
        answer: answer.target != null
            ? FieldAnswerMapper.mapToEntity(answer.target!)
            : null,
        title: title,
        fieldType: formFieldType,
        lastUpdate: lastUpdate,
        remoteId: remoteId,
        localId: localId);
  }

  @override
  toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
