import 'package:appointments_manager/core/abstractions/entity.dart';
import 'package:appointments_manager/features/appointment/data/models/appointment.dart';
import 'package:appointments_manager/features/appointment/domain/contracts/appointment_contract.dart';
import 'package:appointments_manager/features/client/domain/entities/client_entity.dart';

class AppointmentEntity extends CoreEntity<AppointmentModel>
    implements AppointmentContract {
  @override
  late DateTime lastUpdate;
  @override
  int localId;
  @override
  String remoteId;
  @override
  DateTime fromDate;
  @override
  DateTime toDate;
  ClientEntity client;

  @override
  Duration get duration => toDate.difference(fromDate);

  AppointmentEntity({this.localId = 0,
    DateTime? lastUpdate,
    this.remoteId = "",
    required this.fromDate,
    required this.toDate,
    required this.client}) {
    this.lastUpdate = lastUpdate ?? DateTime.now();
  }

  @override
  AppointmentModel toModel() {
    final appointment = AppointmentModel(
        fromDate: fromDate, toDate: toDate, lastUpdate: lastUpdate);
    appointment.client.target = client.toModel();
    return appointment;
  }
}
