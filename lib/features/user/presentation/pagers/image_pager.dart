
import 'package:appointments_manager/core/utils/assets.dart';
import 'package:appointments_manager/core/utils/colors.dart';
import 'package:appointments_manager/core/utils/translations.dart';
import 'package:appointments_manager/features/user/presentation/controllers/setup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:lottie/lottie.dart';




class ImagePager extends StatelessWidget {
  const ImagePager({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Obx(
                () => InkWell(
                  onTap: SetupController.to.pickImage,
                  child: Stack(
                    children: [
                      SetupController.to.image.value == null
                          ? Lottie.asset(
                              LottieAssets.avatar,
                              height: MediaQuery.of(context).size.height * 0.3,
                            )
                          : CircleAvatar(
                              radius: MediaQuery.of(context).size.height * 0.15,
                              backgroundImage:
                                  FileImage(SetupController.to.image.value!),
                            ),
                      if (SetupController.to.image.value != null)
                        Positioned(
                          top: -10,
                          right: -10,
                          child: IconButton(
                            onPressed: SetupController.to.detachImage,
                            icon: const Icon(HugeIcons.strokeRoundedCancel01),
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      if (SetupController.to.image.value == null)
                        Positioned(
                          bottom: 10,
                          right: 30,
                          child: IconButton(
                            onPressed: null,
                            icon: const Icon(HugeIcons.strokeRoundedCamera01,
                                size: 30),
                            color: Theme.of(context).colorScheme.error,
                          ),
                        )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(Translator.chooseYouProfileImage.tr,
                  style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 20),
            ],
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(
                  () => ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: SetupController.to.image.value != null
                          ? Theme.of(context).colorScheme.secondary
                          : Theme.of(context).cardColor,
                      foregroundColor: SetupController.to.image.value != null
                          ? ThemeColors.white
                          : Theme.of(context).primaryColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: SetupController.to.nextStep,
                    child: SetupController.to.image.value != null
                        ? Text(Translator.next.tr)
                        : Text(Translator.continueWithoutImage.tr),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
