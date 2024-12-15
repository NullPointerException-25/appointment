import 'dart:io';

import 'package:appointments_manager/features/appointment/data/models/appointment.dart';
import 'package:get/get.dart';
import 'package:objectbox/objectbox.dart';

@Entity(uid: 3)
class ClientModel {
  @Id()
  int id = 0;
  String name;
  String email;
  String phone;
  String imagePath;
  String urlImage;
  @Property(type: PropertyType.date)
  DateTime lastUpdate= DateTime.now();
  @Backlink("client")
  final linkAppointments = ToMany<AppointmentSchema>();

  ClientModel({
    int? id,
    required this.name,
     this.urlImage="",
    this.email="",
    required this.lastUpdate,
    this.phone="",
    this.imagePath="",
  }) {
    if (id != null) {
      this.id = id;
    }

  }
}
