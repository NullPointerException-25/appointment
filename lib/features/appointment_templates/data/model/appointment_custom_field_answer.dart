import 'package:appointments_manager/core/abstractions/model.dart';
import 'package:appointments_manager/features/appointment_templates/domain/entities/appointment_custom_field_answer.dart';

import '../../../../objectbox.g.dart';
import '../../mappers/custom_field_answer_mapper.dart';

class AppointmentCustomFieldAnswerModel extends CoreModel<AppointmentCustomFieldAnswerEntity> {
  @override
  @Id()
  int localId;
  @override
  final String remoteId;
  @override
  @Property(type: PropertyType.date)
  late DateTime lastUpdate;
  late int formFieldType;

   List<String> localDocs = [];
   List<String> remoteDocs = [];

   int numberValue = 0;
   String textValue = "";
   DateTime dateValue = DateTime.now();


  AppointmentCustomFieldAnswerModel(
      {
      this.localId = 0,
      this.remoteId = "",
      required this.formFieldType,
      DateTime? lastUpdate}) {
    this.lastUpdate = lastUpdate ?? DateTime.now();
  }

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

  @override
  AppointmentCustomFieldAnswerEntity toEntity() {
      return CustomFieldAnswerMapper.mapToEntity(this);
  }
}