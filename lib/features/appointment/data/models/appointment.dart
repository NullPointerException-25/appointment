import 'package:appointments_manager/core/abstractions/model.dart';
import 'package:appointments_manager/features/appointment/domain/entities/appointment_entity.dart';
import 'package:appointments_manager/features/appointment_templates/data/model/appointment_field.dart';
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
  @Backlink('customFields')
  final fields = ToMany<AppointmentFieldModel>();


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
       lastUpdate: lastUpdate,
       remoteId: remoteId,
       fromDate: fromDate,
       toDate: toDate,
       localId: localId,
       client: client.target!.toEntity(),
     );
  }
}
