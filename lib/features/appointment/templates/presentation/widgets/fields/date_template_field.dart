import 'package:appointments_manager/core/utils/colors.dart';
import 'package:appointments_manager/core/utils/global_values.dart';
import 'package:appointments_manager/core/utils/translations.dart';
import 'package:appointments_manager/core/widgets/text_form_field_core.dart';
import 'package:appointments_manager/features/appointment/templates/domain/entities/field_answer.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:jiffy/jiffy.dart';
import '../../../domain/entities/field.dart';

class DateTemplateField extends StatelessWidget {
  final FieldEntity field;
  late final FieldAnswerEntity<DateTime> answer;
  final editingController = TextEditingController();

  DateTemplateField(this.field, {super.key}) {
    assert(field.fieldType == FormFieldType.date, "Field type must be date");
    assert(field.answer is FieldAnswerEntity<DateTime>,
        "Field answer must be of type DateTime");
    answer = field.answer as FieldAnswerEntity<DateTime>;
    editingController.text = answer.value != DateTime(0)
        ? Jiffy.parse(answer.value.toIso8601String()).yMMMd
        : "";
  }

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
            onTap: () async {
              final date = await showDatePicker(
                context: context,
                firstDate: DateTime.utc(1970),
                lastDate: DateTime.now().add(
                  const Duration(days: 3650),
                ),
              );
              if (date == null) return;
              answer.value = date;
              editingController.text =
                  Jiffy.parse(date.toIso8601String()).yMMMd;
            },
            child: TextFormFieldCore(
              controller: editingController,
              maxLines: 1,
              prefixIcon: Icon(
                HugeIcons.strokeRoundedCalendar01,
                color: Theme.of(context).brightness == Brightness.light
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
