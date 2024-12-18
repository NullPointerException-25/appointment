import 'package:appointments_manager/features/client/data/models/client.dart';
import 'package:objectbox/objectbox.dart';

@Entity(uid: 2)
class AppointmentSchema {
  @Id()
  int id = 0;
  String title;
  String? description;
  @Property(type: PropertyType.date)
  DateTime fromDate;
  @Property(type: PropertyType.date)
  DateTime toDate;
  @Property(type: PropertyType.date)
  DateTime lastUpdate;
  String? location;
  String? imagePath;
  @Transient()
  late Duration duration;
  final client = ToOne<ClientModel>();

  AppointmentSchema({
    int? id,
    required this.title,
    this.description,
    required this.fromDate,
    required this.toDate,
    required this.lastUpdate,
    this.location,
    this.imagePath,
  }) {
    if (id != null) {
      this.id = id;
    }
    duration = toDate.difference(fromDate);
  }
}
