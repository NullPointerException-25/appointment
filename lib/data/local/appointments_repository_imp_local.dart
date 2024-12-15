import 'package:appointments_manager/objectbox.g.dart';
import 'package:appointments_manager/repository/appointments_repository.dart';
import 'package:appointments_manager/schema/appointment.dart';
import 'package:appointments_manager/schema/client.dart';
import 'package:appointments_manager/services/object_box_service.dart';
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
      ClientSchema client,
      {int limit = 10,
      int offset = 0}) async {
    final clientBox = store.value?.box<ClientSchema>().get(client.id);
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
