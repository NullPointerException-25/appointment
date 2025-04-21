import 'package:appointments_manager/core/utils/colors.dart';
import 'package:appointments_manager/core/utils/translations.dart';
import 'package:appointments_manager/core/widgets/text_form_field_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../core/utils/global_values.dart';
import '../../../data/model/field.dart';
import '../../../domain/entities/field.dart';

class DateTemplateField extends StatelessWidget {
  DateTemplateField(this.field, {super.key}) {
    assert(field.fieldType == FormFieldType.date, "Field type must be date");
  }

  final FieldEntity field;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          top: kPaddingM, left: kPaddingM, right: kPaddingM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: kSpacing,
        children: [
          Text(
            field.title,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          InkWell(
            onTap: () {},
            child: TextFormFieldCore(
              maxLines: 1,
              prefixIcon: Icon(
                HugeIcons.strokeRoundedCalendar01,
                color: Theme.of(context).brightness== Brightness.light
                    ? ThemeColors.dark
                    : ThemeColors.white,
              ),
              enabled: false,
              onChanged: (value) {},
              hintText: Translator.clickToChangeDate.tr,
            ),
          ),
        ],
      ),
    );
  }
}
