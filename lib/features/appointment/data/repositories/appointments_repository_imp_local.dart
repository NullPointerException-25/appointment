import 'package:appointments_manager/features/appointment/data/datasource/local_appointments_datasource.dart';
import 'package:appointments_manager/features/appointment/domain/repositories/appointments_repository.dart';
import 'package:appointments_manager/features/appointment/data/models/appointment.dart';
import 'package:appointments_manager/features/client/data/models/client.dart';
import 'package:get/get.dart';

class AppointmentsRepositoryImpLocal extends GetxService
    implements AppointmentsRepository {
  late final LocalAppointmentsDatasource _localAppointmentsDatasource;
  static AppointmentsRepositoryImpLocal get to => Get.find<AppointmentsRepositoryImpLocal>();

  AppointmentsRepositoryImpLocal({LocalAppointmentsDatasource? localAppointmentsDatasource}){
    _localAppointmentsDatasource = localAppointmentsDatasource??LocalAppointmentsDatasource.to;
  }

  @override
  Future<void> deleteAppointment(AppointmentModel appointment) {
    // TODO: implement deleteAppointment
    throw UnimplementedError();
  }

  @override
  Future<List<AppointmentModel>> getAllAppointments() {
    // TODO: implement getAllAppointments
    throw UnimplementedError();
  }

  @override
  Future<List<AppointmentModel>> getAllAppointmentsBetweenDates(DateTime from, DateTime to) {
    // TODO: implement getAllAppointmentsBetweenDates
    throw UnimplementedError();
  }

  @override
  Future<List<AppointmentModel>> getAllAppointmentsFromClient(ClientModel client, {int limit = 10, int offset = 0}) {
    // TODO: implement getAllAppointmentsFromClient
    throw UnimplementedError();
  }

  @override
  Future<AppointmentModel?> getAppointment({int? id, String? remoteId}) {
    // TODO: implement getAppointment
    throw UnimplementedError();
  }

  @override
  Future<AppointmentModel> saveAppointment(AppointmentModel appointment)  async  {
    final result= await _localAppointmentsDatasource.saveAppointment(appointment);
    return result;
  }

  @override
  Future<List<AppointmentModel>> getAppointmentsByClient(ClientModel client) {
    // TODO: implement getAppointmentsByClient
    throw UnimplementedError();
  }

  @override
  Future<List<AppointmentModel>> getAppointmentsByClientAndDate(ClientModel client, DateTime date) {
    // TODO: implement getAppointmentsByClientAndDate
    throw UnimplementedError();
  }

  @override
  Future<List<AppointmentModel>> getAppointmentsByClientAndDateRange(ClientModel client, DateTime from, DateTime to) {
    // TODO: implement getAppointmentsByClientAndDateRange
    throw UnimplementedError();
  }
  /// Return a list of appointments for a given date, if any. All day events are included.
  @override
  Future<List<AppointmentModel>> getAppointmentsByDate(DateTime date) async {
    return await _localAppointmentsDatasource.getAllDayAppointments(date);
  }

  /// Return a list of appointments for a given date range, if any. All day events are included.
  @override
  Future<List<AppointmentModel>> getAppointmentsByDateRange(DateTime from, DateTime to) {
    return _localAppointmentsDatasource.getAppointmentsByDateRange(from, to);
  }

  @override
  Future<List<AppointmentModel>> getOverlappingAppointments(AppointmentModel appointment) async  {
    return await _localAppointmentsDatasource.getOverlappingAppointments(appointment);
  }

  @override
  Future<void> updateAppointment(AppointmentModel appointment) {
    // TODO: implement updateAppointment
    throw UnimplementedError();
  }


}
