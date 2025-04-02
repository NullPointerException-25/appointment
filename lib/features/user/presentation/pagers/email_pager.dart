import 'package:appointments_manager/core/utils/colors.dart';
import 'package:appointments_manager/core/utils/global_values.dart';
import 'package:appointments_manager/core/utils/translations.dart';
import 'package:appointments_manager/features/user/presentation/controllers/setup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

class EmailPager extends StatelessWidget {
  const EmailPager({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text(Translator.signUp.tr,
                  style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: SetupController.to.emailFormKey,
                  child: Column(
                    children: [

                      const SizedBox(height: 10),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        controller: SetupController.to.emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return Translator.pleaseEnterSomeText.tr;
                          }
                          if (!GetUtils.isEmail(value.trim())) {
                            return Translator.pleaseEnterAValidEmail.tr;
                          }
                          return null;
                        },
                        style: const TextStyle(fontSize: 16),
                        onChanged: (value) =>
                            SetupController.to.email.value = value,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            HugeIcons.strokeRoundedMail01,
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Theme.of(context).primaryColorDark
                                    : Theme.of(context).primaryColorLight,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColorDark),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: Translator.email.tr,
                          hintStyle: TextStyle(
                              fontSize: 16, color: Theme.of(context).hintColor),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColorLight),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        controller: SetupController.to.passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return Translator.pleaseEnterSomeText.tr;
                          }
                          if (value.trim().length < 8) {
                            return Translator.passwordTooShort.tr;
                          }
                          return null;
                        },
                        style: const TextStyle(fontSize: 16),
                        onChanged: (value) =>
                            SetupController.to.password.value = value,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            HugeIcons.strokeRoundedLockPassword,
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Theme.of(context).primaryColorDark
                                    : Theme.of(context).primaryColorLight,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColorDark),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: Translator.password.tr,
                          hintStyle: TextStyle(
                              fontSize: 16, color: Theme.of(context).hintColor),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColorLight),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller:
                            SetupController.to.confirmPasswordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return Translator.pleaseEnterSomeText.tr;
                          }
                          if (value.trim() !=
                              SetupController.to.password.value) {
                            return Translator.passwordNotMatch.tr;
                          }
                          return null;
                        },
                        style: const TextStyle(fontSize: 16),
                        onChanged: (value) =>
                            SetupController.to.password.value = value,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            HugeIcons.strokeRoundedLockPassword,
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Theme.of(context).primaryColorDark
                                    : Theme.of(context).primaryColorLight,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColorDark),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: Translator.confirmPassword.tr,
                          hintStyle: TextStyle(
                              fontSize: 16, color: Theme.of(context).hintColor),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColorLight),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: kPaddingM),
                        child: Row(
                          spacing: kSpacingM,
                          children: [
                            Icon(
                              HugeIcons.strokeRoundedAlertCircle,
                              size: kIconSizeS,
                              color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Theme.of(context).primaryColorDark
                                  : Theme.of(context).primaryColorLight,
                            ),
                            Expanded(
                              child: Text(
                                Translator.youCanCreateAccountLater.tr,
                                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                  fontSize: 12
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: kPaddingM),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    textStyle:
                        const TextStyle(fontSize: 16, color: ThemeColors.white),
                  ),
                  onPressed: () async {
                    if (SetupController.to.emailFormKey.currentState!
                        .validate()) {
                      SetupController.to.nextStep();
                    }
                  },
                  child: Text(Translator.signUp.tr),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(kPaddingM),
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                  onPressed: () {
                    SetupController.to.email.value = '';
                    SetupController.to.nextStep();
                  },
                  child: Text(Translator.continueWithoutAccount.tr),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
