import 'package:appointments_manager/core/utils/colors.dart';
import 'package:appointments_manager/core/utils/global_values.dart';
import 'package:appointments_manager/core/utils/translations.dart';
import 'package:appointments_manager/core/widgets/text_form_field_core.dart';
import 'package:appointments_manager/features/appointment/presentation/controllers/create_appointment_controller.dart';
import 'package:appointments_manager/features/appointment/presentation/widgets/client_searcher_textfield.dart';
import 'package:appointments_manager/features/appointment/presentation/widgets/duration_slider.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

class CreateAppointmentPage extends GetView<CreateAppointmentController> {
  const CreateAppointmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              Translator.newAppointment.tr,
              style: TextStyle(
                color: Theme.of(context).brightness == Brightness.dark
                    ? ThemeColors.white
                    : ThemeColors.dark,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(kPaddingM),
              child: Column(
                children: [
                  const ClientSearcherTextField(),
                  const SizedBox(
                    height: kPaddingS,
                  ),
                  TextFormFieldCore(
                    controller: controller.startDateTimeTextController,
                    readOnly: true,
                    hintText: Translator.appointmentsDate.tr,
                    labelText: Translator.appointmentsDate.tr,
                    prefixIcon: Icon(
                      HugeIcons.strokeRoundedCalendar01,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? ThemeColors.white
                          : ThemeColors.dark,
                    ),
                    onTap: () {
                      controller.setDateTime();
                    },
                  ),
                  const SizedBox(
                    height: kPaddingS,
                  ),
                  Text(
                    "Duration",
                    style: TextStyle(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? ThemeColors.white
                            : ThemeColors.dark),
                  ),
                  const SizedBox(
                    height: kPaddingS,
                  ),
                  const DurationSlider(),
                  Obx(
                    () => Padding(
                      padding: const EdgeInsets.all(kPaddingS),
                      child: Text(controller.selectedDurationString.value),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
