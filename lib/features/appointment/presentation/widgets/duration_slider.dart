import 'package:appointments_manager/core/utils/colors.dart';
import 'package:appointments_manager/features/appointment/presentation/controllers/create_appointment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DurationSlider extends GetView<CreateAppointmentController> {
  const DurationSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Slider(
        value: controller.sliderValue.value,
        min: 1,
        max: controller.optionsLength.toDouble(),
        divisions: controller.optionsLength - 1,
        thumbColor: ThemeColors.lightBlue,
        secondaryActiveColor: ThemeColors.lightBlue,
        inactiveColor: ThemeColors.lighterBlue,
        activeColor: ThemeColors.darkBlue,
        onChanged: (value) {
          controller.sliderValue.value = value;
        },
      ),
    );
  }
}
