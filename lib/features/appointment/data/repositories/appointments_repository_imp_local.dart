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
  Future<AppointmentModel?> getAppointment(int id) {
    // TODO: implement getAppointment
    throw UnimplementedError();
  }

  @override
  Future<void> saveAppointment(AppointmentModel appointment)  {
    _localAppointmentsDatasource.saveAppointment(appointment);
    return Future.value();
  }


}
