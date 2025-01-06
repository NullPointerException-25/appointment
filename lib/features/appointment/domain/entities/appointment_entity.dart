import 'package:appointments_manager/core/abstractions/entity.dart';
import 'package:appointments_manager/features/appointment/data/models/appointment.dart';
import 'package:appointments_manager/features/client/domain/entities/client_entity.dart';

class AppointmentEntity extends CoreEntity<AppointmentModel> {
  @override
  late DateTime lastUpdate;
  @override
  int localId;
  @override
  String remoteId;

  DateTime fromDate;
  DateTime toDate;
  ClientEntity client;

  Duration get duration => toDate.difference(fromDate);

  AppointmentEntity(
      {this.localId = 0,
      DateTime? lastUpdate,
      this.remoteId = "",
      required this.fromDate,
      required this.toDate,
      required this.client}) {
    this.lastUpdate = lastUpdate ?? DateTime.now();
  }

  @override
  AppointmentModel toModel() {
    return AppointmentModel(
        fromDate: fromDate, toDate: toDate, lastUpdate: lastUpdate)
      ..client.target = client.toModel();
  }
}
