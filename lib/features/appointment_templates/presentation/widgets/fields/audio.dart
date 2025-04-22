import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/global_values.dart';
import '../../../../../core/utils/translations.dart';
import '../../../../../core/widgets/text_form_field_core.dart';
import '../../../domain/entities/field.dart';
import 'package:waveform_recorder/waveform_recorder.dart';

class AudioTemplateField extends StatefulWidget {
  AudioTemplateField(this.field, {super.key}){
    assert(field.fieldType == FormFieldType.audio, "Field type must be audio");
  }
  final FieldEntity field;

  @override
  State<AudioTemplateField> createState() => _AudioTemplateFieldState();
}

class _AudioTemplateFieldState extends State<AudioTemplateField> {
  final _waveController = WaveformRecorderController();

  @override
  void dispose() {
    _waveController.dispose();
    super.dispose();
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
            widget.field.title,
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