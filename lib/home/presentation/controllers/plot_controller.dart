import 'package:appointments_manager/core/utils/translations.dart';
import 'package:appointments_manager/features/appointment/domain/entities/appointment_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../features/appointment/domain/usecases/get_appointments_by_range.dart';

class PlotController extends GetxController {
  static PlotController get to => Get.find<PlotController>();
  late final Rx<DateTime> _selectedDateTop;
  late final Rx<DateTime> _selectedDateBottom;
  final RxList<AppointmentEntity> _appointments = RxList<AppointmentEntity>();
  final RxList<PlotData> plotDataList = RxList<PlotData>();
  final RxInt maxY = 0.obs;
  final showGraph = false.obs;
  final RxMap<int, String> daysOfWeek = RxMap<int, String>({
    1: Translator.shortMonday.tr,
    2: Translator.shortTuesday.tr,
    3: Translator.shortWednesday.tr,
    4: Translator.shortThursday.tr,
    5: Translator.shortFriday.tr,
    6: Translator.shortSaturday.tr,
    7: Translator.shortSunday.tr,
  });

  final Map<int, String> minutesHoursString = {};

  @override
  void onInit() {
    super.onInit();
    _selectedDateTop = DateTime.now().obs;
    _selectedDateBottom = DateTime.now().subtract(const Duration(days: 7)).obs;
    getDaysOfWeek();
    getAppointments();
    ever(_appointments, (value) {
      getSumPerDay();
      getMaxY();
      getHoursSide();
      showGraph.value = true;
    });
  }

  Future<void> getAppointments() async {
    _appointments.value = await GetAppointmentsByRangeUseCase(
      from: _selectedDateBottom.value,
      to: _selectedDateTop.value,
    ).perform();
  }

  void getSumPerDay() {
    for (var appointment in _appointments) {
      final weekday = appointment.fromDate.weekday;
      final minutes = appointment.duration.inMinutes;
      final plotData = plotDataList.firstWhere(
        (element) => element.weekday == weekday,
      );
      plotData.y += minutes;
    }
  }
  void getDaysOfWeek() {
    for (var i = 0; i <= 7; i++) {
      final weekday = _selectedDateBottom.value
          .add(Duration(days: i))
          .weekday;
      plotDataList.add(PlotData(
        y: 0,
        weekday: weekday,
        label: daysOfWeek[weekday] ?? "",
      ));
    }
  }

  void getHoursSide() {
    final getIntermediate = maxY ~/ 3;
    minutesHoursString[getIntermediate~/60] =
        "${(getIntermediate ~/60).toString()} hours";
    minutesHoursString[getIntermediate * 2 ~/60] =
        "${(getIntermediate * 2 ~/60).toString()} hours";
    minutesHoursString[maxY.value~/60] =
        "${(maxY.value ~/60).toString()} hours";

  }

  void getMaxY() {
    maxY.value = plotDataList.map((e) => e.y).reduce((a, b) => a > b ? a : b) + 60;
  }
}

class PlotData {
  int y;
  final int weekday;
  String label;

  PlotData({
    required this.y,
    required this.weekday,
    required this.label,
  });
}
