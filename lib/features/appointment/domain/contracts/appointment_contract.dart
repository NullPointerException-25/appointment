abstract class AppointmentContract {
  late DateTime fromDate;
  late DateTime toDate;

  Duration get duration => toDate.difference(fromDate);

}