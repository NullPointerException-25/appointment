import 'package:appointments_manager/core/abstractions/entity.dart';
import 'package:appointments_manager/features/appointment/data/models/appointment.dart';
import 'package:appointments_manager/features/appointment/domain/contracts/appointment_contract.dart';
import 'package:appointments_manager/features/appointment_templates/domain/entities/field.dart';
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
  List<FieldEntity> customFields;

  @override
  Duration get duration => toDate.difference(fromDate);

  AppointmentEntity(
      {this.localId = 0,
      DateTime? lastUpdate,
      this.remoteId = "",
      required this.fromDate,
      required this.customFields,
      required this.toDate,
      required this.client}) {
    this.lastUpdate = lastUpdate ?? DateTime.now();
  }

  @override
  AppointmentModel toModel() {
    final appointment = AppointmentModel(
        id: localId,
        fromDate: fromDate,
        toDate: toDate,
        lastUpdate: lastUpdate);
    appointment.client.target = client.toModel();
    appointment.fields.clear();
    appointment.fields.addAll(customFields.map((e) => e.toModel()));
    return appointment;
  }

  @override
  String toString() {
    return 'AppointmentEntity{localId: $localId, remoteId: $remoteId, fromDate: $fromDate, toDate: $toDate, client: $client, customFields: $customFields}, duration: $duration';
  }
}
