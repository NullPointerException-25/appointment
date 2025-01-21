import 'package:appointments_manager/core/abstractions/usecases.dart';
import 'package:appointments_manager/features/appointment/domain/contracts/appointment_contract.dart';
import 'package:appointments_manager/features/appointment/domain/entities/appointment_preview.dart';
import 'package:get/get.dart';

class CreateAppointmentPreviews extends UseCase {
  late final List<AppointmentContract> appointments;
  late final Duration appointmentDuration;
  late final DateTime selectedDay;
  CreateAppointmentPreviews(
      {required this.appointments,
      required this.appointmentDuration,
      required this.selectedDay});
  @override
  Future<List<AppointmentContract>> perform() async {
    final List<AppointmentContract> result = [];
    DateTime selectedDayStart =
        DateTime(selectedDay.year, selectedDay.month, selectedDay.day, 8, 0);
    DateTime selectedDayEnd =
        DateTime(selectedDay.year, selectedDay.month, selectedDay.day, 20, 0);
    DateTime current = selectedDayStart;
    while (current.isBefore(selectedDayEnd)) {
      final DateTime end = current.add(appointmentDuration);
      final appointment = appointments.firstWhereOrNull((element) =>
          element.fromDate.isBefore(end) && element.toDate.isAfter(current));
      if (appointment != null) {
        current = appointment.toDate;
        result.add(appointment);
        continue;
      }
      result.add(AppointmentPreview(fromDate: current, toDate: end));
      current = end;
    }
    return result;
  }
}
