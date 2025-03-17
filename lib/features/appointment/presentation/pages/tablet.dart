import 'package:appointments_manager/features/appointment/presentation/controllers/create_appointment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/global_values.dart';
import '../../../../core/utils/translations.dart';
import '../../../appointment_templates/presentation/widgets/custom_field_editing.dart';
import '../../domain/entities/appointment_entity.dart';
import '../../domain/entities/appointment_preview.dart';
import '../widgets/appointment_item.dart';
import '../widgets/appointment_preview_item.dart';
import '../widgets/calendar_date_picker.dart';
import '../widgets/client_searcher_textfield.dart';
import '../widgets/duration_slider.dart' show DurationSlider;

class NewAppointmentTabletPage extends GetView<CreateAppointmentController> {
  const NewAppointmentTabletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? ThemeColors.black
            : ThemeColors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        title: Text(
          Translator.newAppointment.tr,
          style: TextStyle(
            color: Theme.of(context).brightness == Brightness.dark
                ? ThemeColors.white
                : ThemeColors.dark,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(HugeIcons.strokeRoundedView),
            tooltip: Translator.preview.tr,
            onPressed: () {},
          ),

          IconButton(
            icon: const Icon(HugeIcons.strokeRoundedFloppyDisk),
            tooltip: Translator.save.tr,
            onPressed: () {
              controller.createAppointment();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
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
                              child: Text(controller
                                  .selectedDurationString.value),
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
                                appointment:
                                    controller.todayAppointments[index]
                                        as AppointmentEntity);
                          }),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(kPaddingM),
                    child: Text(
                      textAlign: TextAlign.center,
                      Translator.customFields.tr,
                      style: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? ThemeColors.white
                              : ThemeColors.dark),
                    ),
                  ),
                ),
                Obx(
                  () => SliverPadding(
                    padding: const EdgeInsets.all(kPaddingM),
                    sliver: SliverList.builder(
                        itemCount:
                            controller.customFields.length + 1,
                        itemBuilder: (context, index) {
                          if (index ==
                              controller.customFields.length) {
                            return Padding(
                              padding: const EdgeInsets.all(kPadding),
                              child: Row(
                                children: [
                                  ElevatedButton.icon(
                                    icon: const Icon(
                                      HugeIcons.strokeRoundedAdd01,
                                      color: ThemeColors.white,
                                    ),
                                    onPressed: () {
                                      controller.addNewField();
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
                          return CustomFieldEditing(
                              field: controller.customFields[index]);
                        }),
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
