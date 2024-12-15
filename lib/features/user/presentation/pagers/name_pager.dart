
import 'package:appointments_manager/core/utils/assets.dart';
import 'package:appointments_manager/core/utils/colors.dart';
import 'package:appointments_manager/core/utils/translations.dart';
import 'package:appointments_manager/features/user/presentation/controllers/setup_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:lottie/lottie.dart';

class NamePager extends StatelessWidget {
  const NamePager({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Expanded(
                child: LottieBuilder.asset(LottieAssets.abstract),
              ),
              const SizedBox(height: 20),
              Text(Translator.whatsYourName,
                  style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  onSubmitted: (_) => SetupController.to.nextStep(),
                  controller: SetupController.to.nameController,
                  style: const TextStyle(fontSize: 16),
                  onChanged: (value) => SetupController.to.name.value = value,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColorDark),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: Translator.name.tr,
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
              const SizedBox(height: 20),
            ],
          ),
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
                  onPressed: SetupController.to.nextStep,
                  child: Text(Translator.next.tr),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
