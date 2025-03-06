import 'package:appointments_manager/core/utils/colors.dart';
import 'package:appointments_manager/core/utils/global_values.dart';
import 'package:appointments_manager/core/utils/translations.dart';
import 'package:appointments_manager/features/appointment/domain/entities/appointment_entity.dart';
import 'package:appointments_manager/features/appointment/domain/entities/appointment_preview.dart';
import 'package:appointments_manager/features/appointment/presentation/controllers/create_appointment_controller.dart';
import 'package:appointments_manager/features/appointment/presentation/widgets/appointment_item.dart';
import 'package:appointments_manager/features/appointment/presentation/widgets/appointment_preview_item.dart';
import 'package:appointments_manager/features/appointment/presentation/widgets/calendar_date_picker.dart';
import 'package:appointments_manager/features/appointment/presentation/widgets/client_searcher_textfield.dart';
import 'package:appointments_manager/features/appointment/presentation/widgets/duration_slider.dart';
import 'package:appointments_manager/features/appointment_templates/presentation/controllers/custom_fields_controller.dart';
import 'package:appointments_manager/features/appointment_templates/presentation/widgets/template_field_builder.dart';

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
                            Translator.duration.tr,
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
                  Obx(
                    () => SliverPadding(
                      padding: const EdgeInsets.all(kPaddingM),
                      sliver: SliverList.builder(
                          itemCount: controller.todayAppointments.length,
                          itemBuilder: (context, index) {
                            if (controller.todayAppointments[index]
                                is AppointmentPreview) {
                              return AppointmentPreviewItem(
                                  controller.todayAppointments[index]
                                      as AppointmentPreview);
                            }
                            return AppointmentItem(
                                appointment: controller.todayAppointments[index]
                                    as AppointmentEntity);
                          }),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(kPaddingM),
                      child: Text(
                        textAlign: TextAlign.center,
                        Translator.customFields.tr,
                        style: TextStyle(
                            color: Theme.of(context).brightness ==
                                Brightness.dark
                                ? ThemeColors.white
                                : ThemeColors.dark),
                      ),
                    ),
                  ),
                  Obx(
                        () => SliverPadding(
                      padding: const EdgeInsets.all(kPaddingM),
                      sliver: SliverList.builder(
                          itemCount: CustomFieldsController.to.customFields.length+1,
                          itemBuilder: (context, index) {
                            if (index == CustomFieldsController.to.customFields.length) {
                              return Padding(
                                padding: const EdgeInsets.all(kPadding),
                                child: Row(
                                  children: [
                                    ElevatedButton.icon(
                                      icon: const Icon(HugeIcons.strokeRoundedAdd01, color: ThemeColors.white,),
                                      onPressed: () {
                                        CustomFieldsController.to.addNewField();
                                      },
                                      label: Text(
                                        Translator.addNewField.tr,
                                        style: const TextStyle(
                                            color: ThemeColors.white,
                                            fontSize: kFontSize,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                            return TemplateFieldBuilder(field: CustomFieldsController.to.customFields[index]);
                          }),
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
