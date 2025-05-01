import 'package:appointments_manager/core/utils/colors.dart';
import 'package:appointments_manager/core/utils/datetime.dart';
import 'package:appointments_manager/core/utils/global_values.dart';
import 'package:appointments_manager/features/appointment/domain/entities/appointment_entity.dart';
import 'package:appointments_manager/features/appointment/presentation/controllers/details_appointment_controller.dart';
import 'package:appointments_manager/features/client/presentation/widgets/client_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:jiffy/jiffy.dart';

import '../../../../../home/presentation/widgets/appbar.dart';
import '../../../../appointment_templates/presentation/widgets/template_field_builder.dart';

class DetailsAppointmentMobilePage
    extends GetView<DetailsAppointmentController> {
  const DetailsAppointmentMobilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: "save",
            onPressed: () {
              controller.saveData();
            },
            child: const HugeIcon(
                icon: HugeIcons.strokeRoundedFloppyDisk, color: ThemeColors.white),
          ),
          const SizedBox(height: kSpacing),
          FloatingActionButton(
            heroTag: "add",
            onPressed: () {},
            child: const HugeIcon(
                icon: HugeIcons.strokeRoundedAdd01, color: ThemeColors.white),
          ),
        ],
      ),
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          const HomeAppBar(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(kPaddingM),
              child: ClientCard(controller: controller),
            ),
          ),
          SliverToBoxAdapter(
            child: ObxValue<Rx<AppointmentEntity>>((appointment) {
              return Column(
                children: [
                  if (DateTime.now().isBetween(
                      appointment.value.fromDate, appointment.value.toDate))
                    const Text("Today"),
                  if (DateTime.now().isBetween(
                      appointment.value.fromDate, appointment.value.toDate))
                    Obx(
                      () => Slider(
                        value:
                            controller.currentProgressMinutes.value.toDouble(),
                        min: 1,
                        max: controller.diffInitialEndTimeMinutes.value
                            .toDouble(),
                        thumbColor: ThemeColors.lightBlue,
                        secondaryActiveColor: ThemeColors.lightBlue,
                        inactiveColor: ThemeColors.lighterBlue,
                        activeColor: ThemeColors.darkBlue,
                        onChanged: (double value) {},
                      ),
                    ),
                  if (!DateTime.now().isBetween(
                      appointment.value.fromDate, appointment.value.toDate))
                    Text(Jiffy.parse(
                            appointment.value.fromDate.toIso8601String())
                        .yMMMd),
                  Text(
                    '${appointment.value.fromDate.toTimeOfDayString()} - ${appointment.value.toDate.toTimeOfDayString()}',
                    style: const TextStyle(fontSize: kFontSize),
                  ),
                ],
              );
            }, controller.appointmentEntity),
          ),
          SliverList.builder(
              itemCount: controller.customFields.length,
              itemBuilder: (context, index) => TemplateFieldBuilder(
                    field: controller.customFields[index],
                  )),
          const SliverPadding(
              padding: EdgeInsets.symmetric(vertical: kPaddingXXL)),
        ],
      )),
    );
  }
}
