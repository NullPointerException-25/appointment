import 'package:appointments_manager/core/abstractions/model.dart';
import 'package:objectbox/objectbox.dart';

import '../../domain/entities/template.dart';
import 'field.dart';

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
        duration: duration,
        fields: fields.map((e) => e.toEntity()).toList(),
        lastUpdate: lastUpdate);
  }

  @override
  toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
