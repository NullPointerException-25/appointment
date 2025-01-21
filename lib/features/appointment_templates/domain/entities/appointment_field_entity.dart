import 'package:appointments_manager/core/abstractions/entity.dart';
import 'package:appointments_manager/features/appointment_templates/data/model/appointment_field.dart';

class AppointmentFieldEntity extends CoreEntity<AppointmentFieldModel> {
  @override
  late DateTime lastUpdate;

  @override
  int localId;

  @override
  String remoteId;

  String title;

  late final FormFieldType fieldType;

  AppointmentFieldEntity(
      {DateTime? lastUpdate,
      this.localId = 0,
      this.remoteId = "",
      required this.title,
      required int fieldType}) {
    this.lastUpdate = lastUpdate ?? DateTime.now();
    this.fieldType = _formFieldTypeMap[fieldType] ?? FormFieldType.unknown;
  }

  @override
  AppointmentFieldModel toModel() {
    return AppointmentFieldModel(
        title,
        _formFieldTypeMap.entries
                .firstWhere((element) => element.value == fieldType)
                .key,
        localId: localId,
        lastUpdate: lastUpdate,
        remoteId: remoteId);
  }

  static const Map<int, FormFieldType> _formFieldTypeMap = {
    0: FormFieldType.unknown,
    1: FormFieldType.number,
    2: FormFieldType.shortText,
    3: FormFieldType.largeText,
    4: FormFieldType.date,
    5: FormFieldType.imageList
  };
}
