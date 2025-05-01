import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/global_values.dart';
import '../../../../../core/utils/translations.dart';
import '../../../../../core/widgets/text_form_field_core.dart';
import '../../../domain/entities/field.dart';
import '../../../domain/entities/field_answer.dart';

class NumberTemplateField extends StatelessWidget {
  final FieldEntity field;
  final editingController = TextEditingController();
  late final FieldAnswerEntity<int> answer;

  NumberTemplateField(this.field, {super.key}) {
    assert(field.fieldType == FormFieldType.number,
        "Field type must be phone number");
    assert(field.answer is FieldAnswerEntity<int>,
        "Field answer must be of type int");
    answer = field.answer as FieldAnswerEntity<int>;
    editingController.text = answer.value != 0 ? answer.value.toString() : "";
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
          TextFormFieldCore(
            controller: editingController,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            maxLines: 1,
            prefixIcon: Icon(
              HugeIcons.strokeRoundedGrid,
              color: Theme.of(context).brightness == Brightness.light
                  ? ThemeColors.dark
                  : ThemeColors.white,
            ),
            keyboardType: TextInputType.number,
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
