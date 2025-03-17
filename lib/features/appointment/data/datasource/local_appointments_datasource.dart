import 'package:appointments_manager/core/services/object_box_service.dart';
import 'package:appointments_manager/features/appointment/data/models/appointment.dart';
import 'package:appointments_manager/objectbox.g.dart';
import 'package:get/get.dart';

class LocalAppointmentsDatasource extends GetxService {
  late final Rx<Store> _store;

  static LocalAppointmentsDatasource get to =>
      Get.find<LocalAppointmentsDatasource>();

  LocalAppointmentsDatasource({ObjectBoxService? objectBoxService}) {
    _store = objectBoxService?.store ?? ObjectBoxService.to.store;
  }

  AppointmentModel saveAppointment(AppointmentModel appointment) {
    final box = _store.value.box<AppointmentModel>();
    final result = box.put(appointment);
    if (result == 0) {
      throw Exception("Failed to save appointment");
    }
    return box.get(result)!;
  }

  void deleteAppointment(AppointmentModel appointment) {
    final box = _store.value.box<AppointmentModel>();
    final result = box.remove(appointment.localId);
    if (!result) {
      throw Exception("Failed to delete appointment");
    }
  }

  Future<List<AppointmentModel>> getAllDayAppointments(DateTime date) async {
    date = DateTime(date.year, date.month, date.day);
    final endDate = DateTime(date.year, date.month, date.day, 23, 59, 59);
    final box = _store.value.box<AppointmentModel>();
    final query = box
        .query(AppointmentModel_.fromDate.betweenDate(date, endDate))
        .order(AppointmentModel_.fromDate)
        .build();
    final result = query.find();
    query.close();
    return result;
  }

  Future<List<AppointmentModel>> getOverlappingAppointments(
      AppointmentModel appointment) async {
    final box = _store.value.box<AppointmentModel>();
    final query = box
        .query(AppointmentModel_.fromDate.lessThanDate(appointment.toDate).and(
            AppointmentModel_.toDate.greaterThanDate(appointment.fromDate)))
        .build();
    final result = query.find();
    query.close();
    return result;
  }

  Future<List<AppointmentModel>> getAppointmentsByDateRange(
      DateTime from, DateTime to) async {
    final box = _store.value.box<AppointmentModel>();
    final query =
        box.query(AppointmentModel_.fromDate.betweenDate(from, to)).build();
    return await query.findAsync();
  }
}
