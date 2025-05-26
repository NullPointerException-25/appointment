import 'package:appointments_manager/core/utils/global_values.dart';
import 'package:appointments_manager/core/utils/translations.dart';
import 'package:appointments_manager/core/widgets/text_form_field_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../domain/entities/field.dart';
import '../../../domain/entities/field_answer.dart';

class LargeTextTemplateField extends StatelessWidget {
  LargeTextTemplateField(this.field, {super.key}) {
    assert(field.fieldType == FormFieldType.largeText,
        "Field type must be large text");
    assert(field.answer is FieldAnswerEntity<String>,
        "Field answer must be of type String");
    final FieldAnswerEntity<String> value =


        field.answer as FieldAnswerEntity<String>;
    text.value = value.value;
    editingController.text = value.value;
  }

  final FieldEntity field;
  final editingController = TextEditingController();
  final RxString text = "".obs;

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
            minLines: 8,
            onChanged: (value) {
              text.value = value;
              field.answer!.value= value;

            },
            hintText: Translator.pleaseEnterSomeText.tr,
          ),
        ],
      ),
    );
  }
}
