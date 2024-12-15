import 'package:appointments_manager/core/services/object_box_service.dart';
import 'package:appointments_manager/objectbox.g.dart';
import 'package:appointments_manager/features/appointment/domain/repositories/appointments_repository.dart';
import 'package:appointments_manager/features/appointment/data/models/appointment.dart';
import 'package:appointments_manager/features/client/data/models/client.dart';
import 'package:get/get.dart';

class AppointmentsRepositoryImpLocal extends GetxService
    implements AppointmentsRepository<QueryBuilder<AppointmentSchema>> {
  final store = ObjectBoxService.to.store;

  @override
  Future<void> deleteAppointment(AppointmentSchema appointment) async {
    store.value?.box<AppointmentSchema>().remove(appointment.id);
    return;
  }

  @override
  Future<List<AppointmentSchema>> getAllAppointments() async {
    return store.value?.box<AppointmentSchema>().getAll() ?? [];
  }

  @override
  Future<List<AppointmentSchema>> getAllAppointmentsBetweenDates(
      DateTime from, DateTime to) async {
    return await store.value
            ?.box<AppointmentSchema>()
            .query(AppointmentSchema_.fromDate
                .greaterOrEqualDate(from)
                .and(AppointmentSchema_.toDate.lessOrEqualDate(to)))
            .build()
            .findAsync() ??
        [];
  }

  @override
  Future<List<AppointmentSchema>> getAllAppointmentsFromClient(
      ClientModel client,
      {int limit = 10,
      int offset = 0}) async {
    final clientBox = store.value?.box<ClientModel>().get(client.id);
    return clientBox?.linkAppointments.getRange(offset, limit).toList()??[];
  }

  @override
  Future<AppointmentSchema?> getAppointment(int id) async {
    return store.value?.box<AppointmentSchema>().get(id);
  }

  @override
  Future<List<AppointmentSchema>> getAppointmentsByQuery(
      QueryBuilder<AppointmentSchema> query) async {
    return await query.build().findAsync();
  }

  @override
  Future<void> saveAppointment(AppointmentSchema appointment) {
    store.value?.box<AppointmentSchema>().put(appointment);
    return Future.value();
  }
}
