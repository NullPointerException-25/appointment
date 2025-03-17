import 'package:appointments_manager/core/utils/global_values.dart';
import 'package:appointments_manager/core/widgets/text_form_field_core.dart';
import 'package:appointments_manager/features/appointment/presentation/controllers/create_appointment_controller.dart';
import 'package:appointments_manager/features/appointment_templates/data/model/appointment_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../domain/entities/appointment_field_entity.dart';

class CustomFieldEditing extends GetView<CreateAppointmentController> {
  const CustomFieldEditing({super.key, required this.field});
  final AppointmentFieldEntity field;


  @override
  Widget build(BuildContext context) {
    final controllerText= TextEditingController(text: field.title);
    return Container(
      padding: const EdgeInsets.only(top: kPaddingM, left: kPaddingM, right: kPaddingM),
      child: Column(
        spacing: kSpacing,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(
                  minWidth: 100,
                  maxWidth: 200
                ),
                child: DropdownButtonFormField<FormFieldType>(
                  style: Theme.of(context).textTheme.bodyMedium,

                  decoration: const InputDecoration(
                    border: InputBorder.none
                  ),
                  value: field.fieldType,
                  onChanged: (value) {
                    field.fieldType = value?? FormFieldType.number;
                  },
                  items:  const [
                    DropdownMenuItem(
                      value: FormFieldType.number,
                      child: Row(
                        spacing: kSpacing,
                        children: [
                           Text("Number"),
                          Icon(HugeIcons.strokeRoundedTextNumberSign),
                        ],
                      ),
                    ),
                    DropdownMenuItem(
                      value: FormFieldType.shortText,
                      child: Row(
                        spacing: kSpacing,
                        children: [
                          Text("Short Text"),
                          Icon(HugeIcons.strokeRoundedText),
                        ],
                      ),
                    ),
                    DropdownMenuItem(
                      value: FormFieldType.largeText,
                      child: Row(
                        spacing: kSpacing,
                        children: [
                          Text("Large Text"),
                          Icon(HugeIcons.strokeRoundedTextIndent),
                        ],
                      ),
                    ),
                    DropdownMenuItem(
                      value: FormFieldType.date,
                      child: Row(
                        spacing: kSpacing,
                        children: [
                          Text("Date"),
                          Icon(HugeIcons.strokeRoundedCalendar01),
                        ],
                      ),
                    ),
                    DropdownMenuItem(
                      value: FormFieldType.imageList,
                      child: Row(
                        spacing: kSpacing,
                        children: [
                          Text("Image List"),
                          Icon(HugeIcons.strokeRoundedImage02),
                        ],
                      ),
                    ),
                    DropdownMenuItem(
                      value: FormFieldType.phoneNumber,
                      child: Row(
                        spacing: kSpacing,
                        children: [
                          Text("Phone Number"),
                          Icon(HugeIcons.strokeRoundedCall),
                        ],
                      ),
                    ),
                    DropdownMenuItem(
                      value: FormFieldType.audio,
                      child: Row(
                        spacing: kSpacing,
                        children: [
                          Text("Audio"),
                          Icon(HugeIcons.strokeRoundedMic01),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                tooltip: "Remove field",
                icon: const Icon(HugeIcons.strokeRoundedDelete01),
                onPressed: () {
                  controller.removeField(field);
                },
              ),
            ],
          ),
          TextFormFieldCore(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a title";
              }
              return null;
            },
            hintText: "Name",
            controller: controllerText,
            onChanged: (value) {
              field.title = value;
            },
          )
        ],
      ),
    );
  }
}
