import 'package:appointments_manager/core/utils/datetime.dart';
import 'package:appointments_manager/features/appointment/domain/entities/appointment_entity.dart';
import 'package:appointments_manager/features/appointment/domain/usecases/get_appointments_by_date.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimelineController extends GetxController {
  static TimelineController get to => Get.find<TimelineController>();
  final appointments = RxList<AppointmentEntity>();
  final _selectedDateTop = Rx<DateTime>(DateTime.now().getWithoutTime());
 // final _selectedDateTop = DateTime(2025,1, 31).getWithoutTime().obs; //Testing purposes only// Testing purposes only
  final scrollController = ScrollController();
  final initDate = DateTime.now().getWithoutTime();

  @override
  void onInit() {
    super.onInit();
    _getAppointmentsAhead();
  }

  RxInt get todayAppointmentsCount {
    return appointments.where((appointment) => appointment.fromDate.isToday()).length.obs;
  }

  ///This method is used to get the appointments that are ahead of the current date
  ///It is called in the [onInit] method because we want to get today's appointments
  ///It should be called when the user scrolls to the bottom of the timeline
  void _getAppointmentsAhead() async {
    if (this.appointments.isEmpty) {
      final appointments =
          await GetAppointmentsByDateUseCase(_selectedDateTop.value).perform();
      this.appointments.value = appointments;
      return;
    }
    _selectedDateTop.value =
        _selectedDateTop.value.add(const Duration(days: 1));
    final appointments =
        await GetAppointmentsByDateUseCase(_selectedDateTop.value).perform();
    this.appointments.addAll(appointments);
  }

  ///This method is used to get the appointments that are before the current date
  ///It is called when the user scrolls to the top of the timeline

}
