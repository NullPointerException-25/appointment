import 'package:appointments_manager/core/utils/colors.dart';
import 'package:appointments_manager/core/utils/global_values.dart';
import 'package:appointments_manager/core/utils/translations.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImagePickerFormField extends FormField<File?> {
  ImagePickerFormField({
    super.key,
    required FormFieldSetter<File?> super.onSaved,
    super.validator,
    super.initialValue,
    AutovalidateMode super.autovalidateMode = AutovalidateMode.disabled,
  }) : super(
    builder: (FormFieldState<File?> state) {
      return GestureDetector(
        onTap: () async {
          if(state.value != null) {
            state.didChange(null);
            return;
          }
          final image = await ImagePicker().pickImage(source: ImageSource.gallery);
          if (image != null) {
            state.didChange(File(image.path));
          }
        },
        child: Container(
          padding: const EdgeInsets.all(kPaddingS),
          decoration: BoxDecoration(
            color: ThemeColors.primary,
            borderRadius: BorderRadius.circular(kCornerRadius),
          ),
          child: Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
              Icon(
                HugeIcons.strokeRoundedImage01,
                size: kIconSizeXS,
                color: Theme.of(state.context).brightness == Brightness.dark
                    ? ThemeColors.white
                    : ThemeColors.dark,
              ),
              const SizedBox(width: 10),
              Text(state.value != null ? Translator.unSelectImage.tr : Translator.selectImage.tr,
                style: TextStyle(
                  fontSize: kFontSizeS,
                  color: Theme.of(state.context).brightness == Brightness.dark
                      ? ThemeColors.white
                      : ThemeColors.dark,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}


