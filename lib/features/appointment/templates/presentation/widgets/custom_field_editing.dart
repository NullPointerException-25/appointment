import 'package:appointments_manager/core/utils/global_values.dart';
import 'package:appointments_manager/core/utils/translations.dart';
import 'package:appointments_manager/core/widgets/text_form_field_core.dart';
import 'package:appointments_manager/features/appointment/presentation/controllers/create_appointment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../domain/entities/field.dart';

class CustomFieldEditing extends GetView<CreateAppointmentController> {
  const CustomFieldEditing({super.key, required this.field});
  final FieldEntity field;


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
                  maxWidth: 250
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
                  items:   [
                    DropdownMenuItem(
                      value: FormFieldType.number,
                      child: Row(
                        spacing: kSpacing,
                        children: [
                           Text(Translator.number.tr),
                          const Icon(HugeIcons.strokeRoundedTextNumberSign),
                        ],
                      ),
                    ),
                    DropdownMenuItem(
                      value: FormFieldType.shortText,
                      child: Row(
                        spacing: kSpacing,
                        children: [
                          Text(Translator.shortText.tr),
                          const Icon(HugeIcons.strokeRoundedText),
                        ],
                      ),
                    ),
                    DropdownMenuItem(
                      value: FormFieldType.largeText,
                      child: Row(
                        spacing: kSpacing,
                        children: [
                          Text(Translator.largeText.tr),
                          const Icon(HugeIcons.strokeRoundedTextIndent),
                        ],
                      ),
                    ),
                    DropdownMenuItem(
                      value: FormFieldType.date,
                      child: Row(
                        spacing: kSpacing,
                        children: [
                          Text(Translator.date.tr),
                          const Icon(HugeIcons.strokeRoundedCalendar01),
                        ],
                      ),
                    ),
                    DropdownMenuItem(
                      value: FormFieldType.imageList,
                      child: Row(
                        spacing: kSpacing,
                        children: [
                          Text(Translator.images.tr),
                          const Icon(HugeIcons.strokeRoundedImage02),
                        ],
                      ),
                    ),
                    DropdownMenuItem(
                      value: FormFieldType.phoneNumber,
                      child: Row(
                        spacing: kSpacing,
                        children: [
                          Text(Translator.phoneNumber.tr),
                          const Icon(HugeIcons.strokeRoundedCall),
                        ],
                      ),
                    ),
                    DropdownMenuItem(
                      value: FormFieldType.audio,
                      child: Row(
                        spacing: kSpacing,
                        children: [
                          Text(Translator.audio.tr),
                          const Icon(HugeIcons.strokeRoundedMic01),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                tooltip: Translator.removeField.tr,
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

                return Translator.nameIsRequired.tr;
              }
              return null;
            },
            minLines: 1,
            maxLines: 2,
            maxLength: 50,
            hintText: Translator.customFieldTitle.tr,
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
