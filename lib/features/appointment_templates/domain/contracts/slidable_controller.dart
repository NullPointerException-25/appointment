import 'package:get/get.dart';

import '../../../../core/utils/translations.dart';

  abstract class SlidableController extends GetxController{
   late final RxDouble sliderValue;
    late final RxString selectedDurationString;
    late final RxInt selectedDuration;
   int get optionsLength => intToDuration.length;

  final Map<int, String> durationTextMap = {
    15: Translator.minutes.trParams({"minutes": "15"}),
    30: Translator.minutes.trParams({"minutes": "30"}),
    45: Translator.minutes.trParams({"minutes": "45"}),
    60: Translator.hour.trParams({"hours": "1"}),
    90: Translator.hourMinutes.trParams({"hours": "1", "minutes": "30"}),
    120: Translator.hour.trParams({"hours": "2"}),
    150: Translator.hourMinutes.trParams({"hours": "2", "minutes": "30"}),
    180: Translator.hour.trParams({"hours": "3"}),
    240: Translator.hour.trParams({"hours": "4"}),
    300: Translator.hour.trParams({"hours": "5"}),
    360: Translator.hour.trParams({"hours": "6"}),
    420: Translator.hour.trParams({"hours": "7"}),
  };

  final Map<int, Duration> intToDuration = {
    1: const Duration(minutes: 15),
    2: const Duration(minutes: 30),
    3: const Duration(minutes: 45),
    4: const Duration(hours: 1),
    5: const Duration(hours: 1, minutes: 30),
    6: const Duration(hours: 2),
    7: const Duration(hours: 2, minutes: 30),
    8: const Duration(hours: 3),
    9: const Duration(hours: 4),
    10: const Duration(hours: 5),
    11: const Duration(hours: 6),
    12: const Duration(hours: 7),
  };
}