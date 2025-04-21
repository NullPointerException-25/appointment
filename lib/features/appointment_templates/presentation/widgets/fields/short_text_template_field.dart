import 'package:appointments_manager/core/utils/translations.dart';
import 'package:appointments_manager/core/widgets/text_form_field_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/global_values.dart';
import '../../../data/model/field.dart';
import '../../../domain/entities/field.dart';

class ShortTextTemplateField extends StatelessWidget {
   ShortTextTemplateField(this.field, {super.key}){
    assert(field.fieldType == FormFieldType.shortText, "Field type must be short text");
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
            onChanged: (value) {
            },
            hintText: Translator.pleaseEnterSomeText.tr,
          ),
        ],
      ),
    );
  }
}
