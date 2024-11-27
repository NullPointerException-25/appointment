import 'package:appointments_manager/controllers/setup/setup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/assets.dart';

class ImagePager extends StatelessWidget {
  const ImagePager({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Obx(
                    () =>
                    InkWell(
                      onTap: SetupController.to.pickImage,
                      child: SetupController.to.image.value == null ? Lottie
                          .asset(
                        LottieAssets.avatar,
                        height: 200,
                      ): CircleAvatar(
                        radius: 100,
                        backgroundImage: FileImage(SetupController.to.image.value!),
                      ),
                    ),
              ),
              const SizedBox(height: 20),
              Text("Choose you profile image", style: Theme
                  .of(context)
                  .textTheme
                  .titleMedium),
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
                    backgroundColor: Theme
                        .of(context)
                        .colorScheme
                        .secondary,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: SetupController.to.nextStep,
                  child: const Text("Next"),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
