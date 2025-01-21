import 'package:appointments_manager/core/utils/colors.dart';
import 'package:appointments_manager/core/utils/global_values.dart';
import 'package:appointments_manager/core/utils/translations.dart';
import 'package:appointments_manager/features/appointment/domain/entities/appointment_entity.dart';
import 'package:appointments_manager/features/appointment/presentation/controllers/create_appointment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarDateAppointmentPicker
    extends GetView<CreateAppointmentController> {
  const CalendarDateAppointmentPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TableCalendar<AppointmentEntity>(
        firstDay: DateTime.now(),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: controller.selectedDateTime.value,
        availableGestures: AvailableGestures.horizontalSwipe,
        selectedDayPredicate: (day) {
          return isSameDay(controller.selectedDateTime.value, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          controller.selectedDateTime.value = selectedDay;
        },
        locale: Get.locale!.languageCode,
        daysOfWeekHeight: kIconSize,
        availableCalendarFormats: {
          CalendarFormat.month: Translator.month.tr,
          CalendarFormat.week: Translator.week.tr,
          CalendarFormat.twoWeeks: Translator.twoWeeks.tr,
        },
        onFormatChanged: (format) {
          controller.calendarFormat.value = format;
        },
        calendarFormat: controller.calendarFormat.value,
        calendarStyle: CalendarStyle(
          todayDecoration: const BoxDecoration(
            color: ThemeColors.darkerBlue,
            shape: BoxShape.circle,
          ),
          selectedDecoration: const BoxDecoration(
            color: ThemeColors.darkBlue,
            shape: BoxShape.circle,
          ),
          holidayDecoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.dark
                ? ThemeColors.white.withOpacity(kOpacity)
                : ThemeColors.dark.withOpacity(kOpacity),
          ),
          disabledTextStyle: TextStyle(
            color: Theme.of(context).brightness == Brightness.dark
                ? ThemeColors.white.withOpacity(kOpacity)
                : ThemeColors.dark,
          ),
        ),
      ),
    );
  }
}
