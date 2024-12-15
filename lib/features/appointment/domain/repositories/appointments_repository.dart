import 'package:appointments_manager/features/appointment/data/models/appointment.dart';
import 'package:appointments_manager/features/client/data/models/client.dart';

abstract class AppointmentsRepository<T> {
  Future<void> saveAppointment(AppointmentSchema appointment);

  Future<AppointmentSchema?> getAppointment(int id);

  Future<List<AppointmentSchema>> getAllAppointmentsFromClient(
      ClientSchema client,
      {int limit = 10,
      int offset = 0});

  Future<List<AppointmentSchema>> getAllAppointmentsBetweenDates(
      DateTime from, DateTime to);

  Future<void> deleteAppointment(AppointmentSchema appointment);

  Future<List<AppointmentSchema>> getAllAppointments();
  Future<List<AppointmentSchema>> getAppointmentsByQuery(T query);
}
