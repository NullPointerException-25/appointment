import 'package:appointments_manager/core/abstractions/model.dart';
import 'package:appointments_manager/features/appointment_templates/data/model/field.dart';
import 'package:appointments_manager/features/appointment_templates/domain/entities/template.dart';
import 'package:objectbox/objectbox.dart';

@Entity(uid: 5)
class AppointmentTemplateModel extends CoreModel<AppointmentTemplateEntity> {
  @override
  @Id()
  int localId;
  @override
  final String remoteId;
  @override
  @Property(type: PropertyType.date)
  final DateTime lastUpdate;
  @Unique()
  final String name;

  final int? duration;

  @Backlink('template')
  final fields = ToMany<FieldModel>();

  AppointmentTemplateModel(this.remoteId, this.lastUpdate,
      {required this.name, this.localId = 0, this.duration});

  @override
  AppointmentTemplateEntity toEntity() {
    return AppointmentTemplateEntity(
        name: name,
        remoteId: remoteId,
        localId: localId,
        lastUpdate: lastUpdate);
  }

  @override
  toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
