import 'package:appointments_manager/features/appointment/data/models/appointment.dart';
import 'package:appointments_manager/features/client/data/models/client.dart';

abstract class AppointmentsRepository<T> {
  Future<void> saveAppointment(AppointmentModel appointment);

  Future<AppointmentModel?> getAppointment(int id);

  Future<List<AppointmentModel>> getAllAppointmentsFromClient(
      ClientModel client,
      {int limit = 10,
      int offset = 0});

  Future<List<AppointmentModel>> getAllAppointmentsBetweenDates(
      DateTime from, DateTime to);

  Future<void> deleteAppointment(AppointmentModel appointment);

  Future<List<AppointmentModel>> getAllAppointments();
  Future<List<AppointmentModel>> getAppointmentsByQuery(T query);
}
