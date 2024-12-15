import 'dart:io';

import 'package:appointments_manager/schema/appointment.dart';
import 'package:get/get.dart';
import 'package:objectbox/objectbox.dart';

@Entity(uid: 3)
class ClientSchema {
  @Id()
  int id = 0;
  String name;
  String? email;
  String? phone;
  String? imagePath;
  @Property(type: PropertyType.date)
  DateTime lastUpdate= DateTime.now();
  @Backlink("client")
  final linkAppointments = ToMany<AppointmentSchema>();
  @Transient()
  Rxn<File> file = Rxn<File>();

  ClientSchema({
    int? id,
    required this.name,
    this.email,
    required this.lastUpdate,
    this.phone,
    this.imagePath,
  }) {
    if (id != null) {
      this.id = id;
    }
    file.value = imagePath != null ? File(imagePath!) : null;
  }
}
