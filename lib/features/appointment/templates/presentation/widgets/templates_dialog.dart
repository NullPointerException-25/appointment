import 'package:appointments_manager/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../core/utils/global_values.dart';
import '../../../../../core/utils/translations.dart';

class TemplatesDialog extends StatelessWidget {
  const TemplatesDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ThemeColors.darkBlue.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(kCornerRadius),
        border: Border.all(
          color: ThemeColors.darkBlue,
          width: 1,
        ),
      ),
      margin: const EdgeInsets.all(kPaddingM),
      padding: const EdgeInsets.all(kPaddingM),
      child: Row(
        spacing: kSpacing,
        children: [
          const HugeIcon(
              icon: HugeIcons
                  .strokeRoundedInformationCircle,
              color: ThemeColors.white),
          Expanded(
            child: Text(
              textAlign: TextAlign.start,
              style: const TextStyle(
                color: ThemeColors.white,
                fontSize: kFontSize,
              ),
              softWrap: true,
              Translator.createTemplateDialog.tr,
            ),
          ),
        ],
      ),
    );
  }
}
