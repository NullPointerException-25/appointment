import 'package:appointments_manager/core/abstractions/model.dart';
import 'package:appointments_manager/features/appointment_templates/domain/entities/appointment_field_entity.dart';
import 'package:objectbox/objectbox.dart';

@Entity(uid: 6)
class AppointmentFieldModel extends CoreModel<AppointmentFieldEntity> {
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

  AppointmentFieldModel(this.title, this.formFieldType,
      {this.localId = 0, this.remoteId = "", DateTime? lastUpdate}) {
    this.lastUpdate = lastUpdate ?? DateTime.now();
  }

  @override
  AppointmentFieldEntity toEntity() {
    return AppointmentFieldEntity(
        title: title,
        fieldType: formFieldType,
        lastUpdate: lastUpdate,
        remoteId: remoteId,
        localId: localId);
  }
}

enum FormFieldType { number, shortText, largeText, date, imageList, unknown }
