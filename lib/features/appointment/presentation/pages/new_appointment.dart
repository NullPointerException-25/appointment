import 'package:appointments_manager/core/utils/colors.dart';
import 'package:appointments_manager/core/utils/global_values.dart';
import 'package:appointments_manager/core/utils/translations.dart';
import 'package:appointments_manager/features/appointment/presentation/controllers/create_appointment_controller.dart';
import 'package:appointments_manager/features/appointment/presentation/widgets/calendar_date_picker.dart';
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
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
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
                            height: kPadding,
                          ),
                          const CalendarDateAppointmentPicker(),
                          const SizedBox(
                            height: kPaddingS,
                          ),
                          Text(
                            "Duration",
                            style: TextStyle(
                                color: Theme.of(context).brightness ==
                                    Brightness.dark
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
                              child:
                              Text(controller.selectedDurationString.value),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Obx( ()=> SliverList.builder(
                      itemCount: controller.todayAppointments.length,
                      itemBuilder: (context, index) => const ListTile(
                        title: Text(
                          "()",
                          style: TextStyle(color: ThemeColors.darkBlue),
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Row(
                      children: [
                        TextButton.icon(
                          onPressed: () {
                         //controller.createAppointment();
                          },
                          icon: Icon(
                            HugeIcons.strokeRoundedAdd01,
                            color: Theme.of(context).brightness == Brightness.dark
                                ? ThemeColors.white
                                : ThemeColors.dark,
                          ),
                          label: Text(
                            Translator.addANewField.tr,
                            style: TextStyle(
                                fontSize: kFontSize,
                                color: Theme.of(context).brightness == Brightness.dark
                                    ? ThemeColors.white
                                    : ThemeColors.dark),
                          ),
                        ),
                      ],
                    ),
                  ), 
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(kPaddingM),
                    child: ElevatedButton(
                      onPressed: () {
                        controller.createAppointment();
                      },
                      child: Text(
                        Translator.save.tr,
                        style: const TextStyle(
                            color: ThemeColors.white,
                            fontSize: kFontSize,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
