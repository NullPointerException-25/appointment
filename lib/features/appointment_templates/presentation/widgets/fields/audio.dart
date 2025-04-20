import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/global_values.dart';
import '../../../../../core/utils/translations.dart';
import '../../../../../core/widgets/text_form_field_core.dart';
import '../../../domain/entities/appointment_field_entity.dart';

class AudioTemplateField extends StatelessWidget {
  AudioTemplateField(this.field, {super.key}){
    assert(field.fieldType == FormFieldType.audio, "Field type must be audio");
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
          Row(
            children: [
              Expanded(
                child: TextFormFieldCore(
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  maxLines: 1,
                  prefixIcon:  Icon(HugeIcons.strokeRoundedMic01,
                    color: Theme.of(context).brightness== Brightness.light
                        ? ThemeColors.dark
                        : ThemeColors.white,
                  ),
                  keyboardType: TextInputType.phone,
                  onChanged: (value) {
                  },
                  hintText: Translator.pleaseEnterSomeText.tr,
                ),
              ),
              const SizedBox(width: kSpacing),
              IconButton(
                icon: const Icon(HugeIcons.strokeRoundedMic01),
                color: Theme.of(context).primaryColor,
                onPressed: () {  },
              ),
            ],
          )
        ],
      ),
    );
  }
}