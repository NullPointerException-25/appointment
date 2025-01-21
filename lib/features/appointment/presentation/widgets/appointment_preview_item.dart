import 'package:appointments_manager/core/utils/colors.dart';
import 'package:appointments_manager/features/appointment/domain/entities/appointment_preview.dart';
import 'package:appointments_manager/features/appointment/presentation/controllers/create_appointment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class AppointmentPreviewItem extends GetView<CreateAppointmentController> {
  const AppointmentPreviewItem(this.appointmentPreview, {super.key});

  final AppointmentPreview appointmentPreview;

  @override
  Widget build(BuildContext context) {
    return ObxValue(
      (selectedAppointmentPreview) {
        return GestureDetector(
          onTap: () {
            controller.setSelectedAppointment(appointmentPreview); 
          },
          child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.only(
                left: 10,
                right: 10,
                top: 5,
                bottom: 5,
              ),
              decoration: BoxDecoration(
                color: selectedAppointmentPreview.value == appointmentPreview
                    ? ThemeColors.darkBlue
                    : Theme.of(context).brightness == Brightness.dark
                        ? ThemeColors.black
                        : ThemeColors.white,
                border: Border.all(
                    color: selectedAppointmentPreview.value == appointmentPreview
                        ? ThemeColors.darkBlue
                        : Theme.of(context).brightness == Brightness.dark
                            ? ThemeColors.white
                            : ThemeColors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                title: Text(
                  Jiffy.parse(appointmentPreview.fromDate.toIso8601String()).Hm,
                  style: TextStyle(
                    color: Theme.of(context).brightness == Brightness.dark || selectedAppointmentPreview.value == appointmentPreview
                        ? ThemeColors.white
                        : ThemeColors.black,
                  ),
                ),
              )),
        );
      },
      controller.selectedAppointmentPreview,
    );
  }
}
