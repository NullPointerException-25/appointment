import 'package:appointments_manager/core/utils/colors.dart';
import 'package:appointments_manager/core/utils/global_values.dart';
import 'package:appointments_manager/core/utils/translations.dart';
import 'package:appointments_manager/core/widgets/text_form_field_core.dart';
import 'package:appointments_manager/features/user/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

class AuthDialog extends StatelessWidget {
  AuthDialog({super.key, required this.user});

  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.surface,
      contentPadding: const EdgeInsets.all(kPaddingXL),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kCornerRadius),
      ),
      content: Form(
        key: formKey,
        child: Column(
          spacing: kSpacingL,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              spacing: kSpacing,
              children: [
                user.localImage.value != null
                    ? CircleAvatar(
                        backgroundImage: FileImage(user.localImage.value!))
                    : Icon(HugeIcons.strokeRoundedUser, color:  Theme.of(context).primaryColor,),
                Text(
                  'Authentication Required\nfor ${user.name}',
                  style: Theme.of(context).textTheme.titleSmall,
                  softWrap: true,
                ),
              ],
            ),
            TextFormFieldCore(
              onFieldSubmitted: (value){
                if (formKey.currentState!.validate()) {
                  Navigator.pop(context, passwordController.text);
                }
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return Translator.pleaseEnterSomeText.tr;
                }

                return null;
              },
              maxLines: 1,
              obscureText: true,
              controller: passwordController,
              hintText: "Introduce password",
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  Navigator.pop(context, passwordController.text.trim());
                }
              },
              child: const Text('Authenticate'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'I forgot my password',
                style: Theme.of(context)
                    .textTheme
                    .displaySmall
                    ?.copyWith(color: ThemeColors.lightBlue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
