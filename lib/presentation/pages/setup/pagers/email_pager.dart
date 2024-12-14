import 'package:appointments_manager/controllers/setup/setup_controller.dart';
import 'package:appointments_manager/utils/assets.dart';
import 'package:appointments_manager/utils/colors.dart';
import 'package:appointments_manager/utils/translations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:lottie/lottie.dart';

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
              Expanded(
                child: LottieBuilder.asset(LottieAssets.email),
              ),
              const SizedBox(height: 20),
              Text(Translator.receiveEmailsOfNewFeatures.tr,
                  style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: SetupController.to.emailFormKey,
                  child: TextFormField(
                    controller: SetupController.to.emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return Translator.pleaseEnterSomeText.tr;
                      }
                      if(!GetUtils.isEmail(value.trim())){
                        return Translator.pleaseEnterAValidEmail.tr;
                      }
                      return null;
                    },
                    style: const TextStyle(fontSize: 16),
                    onChanged: (value) => SetupController.to.email.value = value,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        HugeIcons.strokeRoundedMail01,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColorDark),
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
                padding: const EdgeInsets.all(8.0),
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
                  child: Text(Translator.noThanks.tr),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
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
                  onPressed: ()async {
                    if(SetupController.to.emailFormKey.currentState!.validate()){
                      SetupController.to.nextStep();
                    }
                  },
                  child:  Text(Translator.finish.tr),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
