import 'package:appointments_manager/features/appointment/domain/contracts/appointment_contract.dart';

class AppointmentPreview implements AppointmentContract{
   @override
  DateTime fromDate;
   @override
  DateTime toDate;

    AppointmentPreview({required this.fromDate, required this.toDate});

  @override
  Duration get duration => toDate.difference(fromDate);
}