import 'package:appointments_manager/core/utils/colors.dart';
import 'package:appointments_manager/core/utils/global_values.dart';
import 'package:appointments_manager/core/utils/translations.dart';
import 'package:appointments_manager/core/widgets/image_picker_form_field_core.dart';
import 'package:appointments_manager/core/widgets/text_form_field_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:hugeicons/hugeicons.dart';

class CreateClientForm extends StatelessWidget {
   CreateClientForm({super.key});
  final formKey = GlobalKey<FormState>();
  final focusNodeName = FocusNode();
  final focusNodeEmail = FocusNode();
  final focusNodePhone = FocusNode();
  final focusNodeDescription = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: kPaddingS),
                child: ImagePickerFormField(onSaved: (value) {
                  print(value);
                }),
              ),
            ],
          ),
          TextFormFieldCore(
            focusNode: focusNodeName,
            onFieldSubmitted: (value) {
              FocusScope.of(context).requestFocus(focusNodePhone);
              Scrollable.ensureVisible(focusNodePhone.context!, duration: const Duration(milliseconds: 500));

            },
            autofillHints: AutofillHints.name,
            autofocus: true,
            maxLines: 1,
            hintText: Translator.name.tr,
            labelText: Translator.name.tr,
            textInputAction: TextInputAction.next,
            prefixIcon: Icon(
              HugeIcons.strokeRoundedUser,
              color: Theme.of(context).brightness ==
                  Brightness.dark
                  ? ThemeColors.white
                  : ThemeColors.dark,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormFieldCore(
            focusNode: focusNodePhone,
            onFieldSubmitted: (value) {
              FocusScope.of(context).requestFocus(focusNodeEmail);
              Scrollable.ensureVisible(focusNodeEmail.context!, duration: const Duration(milliseconds: 500));

            },
            prefixIcon: Icon(
              HugeIcons.strokeRoundedTelephone,
              color: Theme.of(context).brightness ==
                  Brightness.dark
                  ? ThemeColors.white
                  : ThemeColors.dark,
            ),
            labelText: Translator.phone.tr,
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.next,
            autofillHints: AutofillHints.telephoneNumber,
            hintText: Translator.phone.tr,
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormFieldCore(
            focusNode: focusNodeEmail,
            onFieldSubmitted: (value) {
              FocusScope.of(context).requestFocus(focusNodeDescription);
              Scrollable.ensureVisible(focusNodeDescription.context!, duration: const Duration(milliseconds: 500));
            },
            prefixIcon: Icon(
              HugeIcons.strokeRoundedMail01,
              color: Theme.of(context).brightness ==
                  Brightness.dark
                  ? ThemeColors.white
                  : ThemeColors.dark,
            ),
            labelText: Translator.email.tr,
            keyboardType: TextInputType.emailAddress,
            hintText: Translator.email.tr,
            textInputAction: TextInputAction.next,
            autofillHints: AutofillHints.email,
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormFieldCore(
            focusNode: focusNodeDescription,
            minLines: 3,
            hintText:
            Translator.descriptionHint.tr,
            keyboardType: TextInputType.emailAddress,
            labelText: 'Description',
            textInputAction: TextInputAction.next,
          ),
        ],
      ),
    );
  }
}
