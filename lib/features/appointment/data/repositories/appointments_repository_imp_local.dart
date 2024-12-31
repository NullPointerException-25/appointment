import 'package:appointments_manager/core/services/object_box_service.dart';
import 'package:appointments_manager/objectbox.g.dart';
import 'package:appointments_manager/features/appointment/domain/repositories/appointments_repository.dart';
import 'package:appointments_manager/features/appointment/data/models/appointment.dart';
import 'package:appointments_manager/features/client/data/models/client.dart';
import 'package:get/get.dart';

class AppointmentsRepositoryImpLocal extends GetxService
    implements AppointmentsRepository<QueryBuilder<AppointmentModel>> {
  late final Rx<Store> _store;
  static AppointmentsRepositoryImpLocal get to => Get.find<AppointmentsRepositoryImpLocal>();

  AppointmentsRepositoryImpLocal(ObjectBoxService objectBoxService){
    _store = objectBoxService.store;
  }

  @override
  Future<void> deleteAppointment(AppointmentModel appointment) async {
    _store.value.box<AppointmentModel>().remove(appointment.localId);
    return;
  }

  @override
  Future<List<AppointmentModel>> getAllAppointments() async {
    return _store.value.box<AppointmentModel>().getAll();
  }

  @override
  Future<List<AppointmentModel>> getAllAppointmentsBetweenDates(
      DateTime from, DateTime to) async {
    return await _store.value
            .box<AppointmentModel>()
            .query(AppointmentModel_.fromDate
                .greaterOrEqualDate(from)
                .and(AppointmentModel_.toDate.lessOrEqualDate(to)))
            .build()
            .findAsync();
  }

  @override
  Future<List<AppointmentModel>> getAllAppointmentsFromClient(
      ClientModel client,
      {int limit = 10,
      int offset = 0}) async {
    final clientBox = _store.value.box<ClientModel>().get(client.localId);
    return clientBox?.linkAppointments.getRange(offset, limit).toList()??[];
  }

  @override
  Future<AppointmentModel?> getAppointment(int id) async {
    return _store.value.box<AppointmentModel>().get(id);
  }

  @override
  Future<List<AppointmentModel>> getAppointmentsByQuery(
      QueryBuilder<AppointmentModel> query) async {
    return await query.build().findAsync();
  }

  @override
  Future<void> saveAppointment(AppointmentModel appointment) {
    _store.value.box<AppointmentModel>().put(appointment);
    return Future.value();
  }
}
