import 'package:jiffy/jiffy.dart';

extension DateTimeExtension on DateTime {
  String toExtendedFormattedString() {
    return Jiffy.parse(toIso8601String()).yMMMMEEEEdjm;
  }
  String toTimeOfDayString() {
    return Jiffy.parse(toIso8601String()).jm;
  }
  DateTime getWithoutTime() {
    return DateTime(year, month, day);
  }
  DateTime getEndOfDay() {
    return DateTime(year, month, day, 23, 59, 59, 999);
  }

  bool isBetween(DateTime start, DateTime end, {bool inclusive = true}) {
    if (inclusive) {
      return (isAfter(start) || isAtSameMomentAs(start)) &&
          (isBefore(end) || isAtSameMomentAs(end));
    } else {
      return isAfter(start) && isBefore(end);
    }
  }

  bool isToday() {
    return getWithoutTime().isAtSameMomentAs(DateTime.now().getWithoutTime());
  }
}