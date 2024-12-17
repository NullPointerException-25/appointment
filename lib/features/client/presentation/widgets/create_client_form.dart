import 'package:appointments_manager/core/utils/colors.dart';
import 'package:appointments_manager/core/utils/global_values.dart';
import 'package:appointments_manager/core/utils/translations.dart';
import 'package:appointments_manager/core/widgets/image_picker_form_field_core.dart';
import 'package:appointments_manager/core/widgets/text_form_field_core.dart';
import 'package:appointments_manager/features/client/presentation/controllers/create_client_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

class CreateClientForm extends GetView<CreateClientController> {
   CreateClientForm({super.key});
  final focusNodeName = FocusNode();
  final focusNodeEmail = FocusNode();
  final focusNodePhone = FocusNode();
  final focusNodeDescription = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: kPaddingS),
                child: ImagePickerFormField(onSaved: (value) {
                  controller.image.value = value;
                }),
              ),
            ],
          ),
          TextFormFieldCore(
            maxLength: 30,
            onChanged: (value) {
              controller.name.value = value;
            },
            focusNode: focusNodeName,
            onFieldSubmitted: (value) {
              FocusScope.of(context).requestFocus(focusNodePhone);
              Scrollable.ensureVisible(focusNodePhone.context!, duration: const Duration(milliseconds: 500));

            },
            validator: (value) {
              if (value!.isEmpty) {
                return Translator.pleaseEnterSomeText.tr;
              }
              return null;
            },
            autofillHints: AutofillHints.name,
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
            height: kPaddingS,
          ),
          TextFormFieldCore(
            maxLength: 15,
            focusNode: focusNodePhone,
            onFieldSubmitted: (value) {
              FocusScope.of(context).requestFocus(focusNodeEmail);
              Scrollable.ensureVisible(focusNodeEmail.context!, duration: const Duration(milliseconds: 500));

            },
            validator: (value) {
              if(value!=null){
                if (!value.trim().isPhoneNumber) {
                  return Translator.enterValidPhone.tr;
                }
              }
              return null;
            },
            onChanged: (value) {
              controller.phone.value = value;
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
            height: kPaddingS,
          ),
          TextFormFieldCore(
            maxLength: 50,
            focusNode: focusNodeEmail,
            onFieldSubmitted: (value) {
              FocusScope.of(context).requestFocus(focusNodeDescription);
              Scrollable.ensureVisible(focusNodeDescription.context!, duration: const Duration(milliseconds: 500));
            },
            onChanged: (value) {
              controller.email.value = value;
            },
            validator: (value) {
              if(value!=null){
                if (!value.trim().isEmail) {
                  return Translator.pleaseEnterAValidEmail.tr;
                }
              }
              return null;
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
            height: kPaddingS,
          ),
          TextFormFieldCore(
            maxLength: 300,
            onChanged: (value) {
              controller.description.value = value;
            },
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
