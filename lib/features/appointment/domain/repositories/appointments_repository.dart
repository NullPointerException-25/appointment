import 'package:appointments_manager/features/appointment/data/models/appointment.dart';
import 'package:appointments_manager/features/client/data/models/client.dart';

abstract class AppointmentsRepository {
  Future<void> saveAppointment(AppointmentModel appointment);

  Future<AppointmentModel?> getAppointment({int? id, String? remoteId});

  Future<List<AppointmentModel>> getAllAppointmentsFromClient(
      ClientModel client,
      {int limit = 10,
      int offset = 0});

  Future<List<AppointmentModel>> getAllAppointmentsBetweenDates(
      DateTime from, DateTime to);

  Future<void> deleteAppointment(AppointmentModel appointment);

  Future<List<AppointmentModel>> getAllAppointments();

  Future<void> updateAppointment(AppointmentModel appointment);

  Future<List<AppointmentModel>> getAppointmentsByDate(DateTime date);

  Future<List<AppointmentModel>> getAppointmentsByClient(ClientModel client);

  Future<List<AppointmentModel>> getAppointmentsByClientAndDate(ClientModel client, DateTime date);

  Future<List<AppointmentModel>> getAppointmentsByDateRange(DateTime from, DateTime to);

  Future<List<AppointmentModel>> getAppointmentsByClientAndDateRange(ClientModel client, DateTime from, DateTime to);

  Future<List<AppointmentModel>> getOverlappingAppointments(AppointmentModel appointment);
}
