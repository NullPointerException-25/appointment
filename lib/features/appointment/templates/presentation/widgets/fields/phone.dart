import 'package:appointments_manager/core/utils/colors.dart';
import 'package:appointments_manager/core/utils/global_values.dart';
import 'package:appointments_manager/core/utils/translations.dart';
import 'package:appointments_manager/core/widgets/text_form_field_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../domain/entities/field.dart';
import '../../../domain/entities/field_answer.dart';

class PhoneNumberTemplateField extends StatelessWidget {
  final FieldEntity field;
  final editingController = TextEditingController();
  late final FieldAnswerEntity<int> answer;

  PhoneNumberTemplateField(this.field, {super.key}){
    assert(field.fieldType == FormFieldType.phoneNumber, "Field type must be phone number");
    answer = field.answer as FieldAnswerEntity<int>;
    editingController.text = answer.value != 0 ? answer.value.toString() : "";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: kPaddingM, left: kPaddingM, right: kPaddingM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: kSpacing,
        children: [
          Text(
            field.title,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          TextFormFieldCore(
            controller: editingController,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly
            ],
            maxLines: 1,
            prefixIcon:  Icon(HugeIcons.strokeRoundedCall,
              color: Theme.of(context).brightness== Brightness.light
                  ? ThemeColors.dark
                  : ThemeColors.white,
            ),
            keyboardType: TextInputType.phone,
            onChanged: (value) {
              if (value.isNotEmpty) {
                answer.value = int.parse(value);
              } else {
                answer.value = 0;
              }
            },
            hintText: Translator.pleaseEnterSomeText.tr,
          ),
        ],
      ),
    );
  }
}