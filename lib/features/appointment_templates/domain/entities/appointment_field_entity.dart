import 'package:appointments_manager/core/abstractions/entity.dart';
import 'package:appointments_manager/features/appointment_templates/data/model/appointment_field.dart';

import '../../../../core/utils/global_values.dart';

class AppointmentFieldEntity extends CoreEntity<AppointmentFieldModel> {
  @override
  late DateTime lastUpdate;

  @override
  int localId;

  @override
  String remoteId;

  String title;

  late FormFieldType fieldType;

  AppointmentFieldEntity(
      {DateTime? lastUpdate,
      this.localId = 0,
      this.remoteId = "",
      required this.title, int fieldType=1}) {
    this.lastUpdate = lastUpdate ?? DateTime.now();
    this.fieldType = formFieldTypeMap[fieldType] ?? FormFieldType.unknown;
  }


  @override
  AppointmentFieldModel toModel() {
    return AppointmentFieldModel(
        title,
        formFieldTypeMap.entries
                .firstWhere((element) => element.value == fieldType)
                .key,
        localId: localId,
        lastUpdate: lastUpdate,
        remoteId: remoteId);
  }


}
