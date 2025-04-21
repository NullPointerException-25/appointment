import 'package:appointments_manager/core/abstractions/model.dart';
import 'package:appointments_manager/features/appointment/domain/entities/appointment_entity.dart';
import 'package:appointments_manager/features/appointment_templates/data/model/field.dart';
import 'package:appointments_manager/features/client/data/models/client.dart';
import 'package:objectbox/objectbox.dart';

@Entity(uid: 2)
class AppointmentModel extends CoreModel<AppointmentEntity>{
  @override
  @Id()
  int localId = 0;
  @override
  String remoteId;
  @Property(type: PropertyType.date)
  DateTime fromDate;
  @Property(type: PropertyType.date)
  DateTime toDate;
  @override
  @Property(type: PropertyType.date)
  DateTime lastUpdate;
  final client = ToOne<ClientModel>();

  @Backlink('appointment')
  final fields = ToMany<FieldModel>();


  AppointmentModel({
    int? id,
    this.remoteId="",
    required this.fromDate,
    required this.toDate,
    required this.lastUpdate,

  }) {
    if (id != null) {
      localId = id;
    }
  }

  @override
  AppointmentEntity toEntity() {
     return AppointmentEntity(
       customFields: fields.map((e) => e.toEntity()).toList(),
       lastUpdate: lastUpdate,
       remoteId: remoteId,
       fromDate: fromDate,
       toDate: toDate,
       localId: localId,
       client: client.target!.toEntity(),
     );
  }

  @override
  toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
