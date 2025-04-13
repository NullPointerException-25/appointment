import 'package:appointments_manager/core/utils/translations.dart';
import 'package:appointments_manager/core/widgets/text_form_field_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/global_values.dart';
import '../../../data/model/appointment_field.dart';
import '../../../domain/entities/appointment_field_entity.dart';

class LargeTextTemplateField extends StatelessWidget {
  LargeTextTemplateField(this.field, {super.key}){
    assert(field.fieldType == FormFieldType.largeText, "Field type must be large text");
  }
  final AppointmentFieldEntity field;

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
            minLines: 8,
            onChanged: (value) {
            },
            hintText: Translator.pleaseEnterSomeText.tr,
          ),
        ],
      ),
    );
  }
}