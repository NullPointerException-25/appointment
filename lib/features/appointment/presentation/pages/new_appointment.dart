import 'package:appointments_manager/core/utils/colors.dart';
import 'package:appointments_manager/core/utils/global_values.dart';
import 'package:appointments_manager/core/widgets/text_form_field_core.dart';
import 'package:appointments_manager/features/appointment/presentation/controllers/create_appointment_controller.dart';
import 'package:appointments_manager/features/client/domain/entities/client_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
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
              "New appointment",
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
                  Obx(
                    () => TypeAheadField<ClientEntity>(
                      controller: controller.clientNameSearchTextController,
                      itemBuilder: (context, value) => ListTile(
                        title: Text(value.name),
                      ),
                      onSelected: (value) {},
                      emptyBuilder: (context) {
                        return const SizedBox();
                      },
                      builder: (context, controller, focusNode) =>
                          TextFormFieldCore(
                              prefixIcon: HugeIcon(
                                  icon: HugeIcons.strokeRoundedUser,
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? ThemeColors.white
                                      : ThemeColors.dark),
                              textInputAction: TextInputAction.next,
                              controller: controller,
                              focusNode: focusNode,
                              hintText: "Client name"),
                      suggestionsCallback: (search) => controller.clients,
                    ),
                  ),
                  const SizedBox(
                    height: kPaddingS,
                  ),
                  TextFormFieldCore(
                    readOnly: true,
                    hintText: "Appointment day",
                    labelText: "Appointment day",
                    prefixIcon: Icon(
                      HugeIcons.strokeRoundedCalendar01,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? ThemeColors.white
                          : ThemeColors.dark,
                    ),
                    onTap: () {
                      showDatePicker(
                          context: context,
                          firstDate: DateTime.now(),
                          lastDate:
                              DateTime.now().add(const Duration(days: 365)));
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
                  Obx(
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
                  ),
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
