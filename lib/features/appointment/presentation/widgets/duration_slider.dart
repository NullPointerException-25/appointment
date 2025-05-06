import 'package:appointments_manager/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../appointment_templates/domain/contracts/slidable_controller.dart';

class DurationSlider<T extends SlidableController> extends GetView<T> {
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
