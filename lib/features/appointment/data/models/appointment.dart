import 'package:appointments_manager/features/client/data/models/client.dart';
import 'package:objectbox/objectbox.dart';

@Entity(uid: 2)
class AppointmentModel {
  @Id()
  int id = 0;
  String remoteId;
  @Property(type: PropertyType.date)
  DateTime fromDate;
  @Property(type: PropertyType.date)
  DateTime toDate;
  @Property(type: PropertyType.date)
  DateTime lastUpdate;
  @Transient()
  late Duration duration;
  final client = ToOne<ClientModel>();

  @Backlink("fields")
  final fields = ToMany<AppointmentModel>(); 


  AppointmentModel({
    int? id,
    this.remoteId="",
    required this.fromDate,
    required this.toDate,
    required this.lastUpdate,
  }) {
    if (id != null) {
      this.id = id;
    }
    duration = toDate.difference(fromDate);
  }
}
