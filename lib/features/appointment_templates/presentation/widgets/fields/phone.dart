import 'package:appointments_manager/core/utils/translations.dart';
import 'package:appointments_manager/core/widgets/text_form_field_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/global_values.dart';
import '../../../data/model/field.dart';
import '../../../domain/entities/field.dart';

class PhoneNumberTemplateField extends StatelessWidget {
  PhoneNumberTemplateField(this.field, {super.key}){
    assert(field.fieldType == FormFieldType.phoneNumber, "Field type must be phone number");
  }
  final FieldEntity field;

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
            },
            hintText: Translator.pleaseEnterSomeText.tr,
          ),
        ],
      ),
    );
  }
}