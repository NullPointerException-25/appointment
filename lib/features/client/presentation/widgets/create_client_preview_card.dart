import 'package:appointments_manager/core/utils/colors.dart';
import 'package:appointments_manager/core/utils/global_values.dart';
import 'package:appointments_manager/features/client/presentation/controllers/create_client_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:mesh_gradient/mesh_gradient.dart';

class CreateClientPreviewCard extends GetView<CreateClientController> {
  const CreateClientPreviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(kCornerRadiusM),
      child: AnimatedMeshGradient(
        colors: [
          ThemeColors.lightBlue,
          ThemeColors.lightBlue,
          Theme.of(context).brightness == Brightness.dark
              ? ThemeColors.darkerBlue
              : ThemeColors.primary.shade300,
          Theme.of(context).brightness == Brightness.dark
              ? ThemeColors.darkerBlue
              : ThemeColors.primary.shade300,
        ],
        options: AnimatedMeshGradientOptions(),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(kPaddingM),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    controller.image.value != null
                        ? CircleAvatar(
                      radius: kIconSizeM/2,
                            backgroundImage: FileImage(
                              controller.image.value!,
                            ),
                          )
                        : const Icon(
                            HugeIcons.strokeRoundedUser,
                            size: kIconSizeM,
                          ),
                    const SizedBox(width: kPaddingS),
                    Flexible(
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        controller.name.value.isEmpty
                            ? "Name"
                            : controller.name.value,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: ThemeColors.white
                            ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: kPadding),
                Row(
                    children: [
                      const Icon(
                        HugeIcons.strokeRoundedMail01,
                        size: 20,
                      ),
                      const SizedBox(width: kPaddingS),
                      Flexible(
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          controller.email.value.isEmpty
                              ? "Email"
                              : controller.email.value,
                          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                color: ThemeColors.white
                              ),
                        ),
                      ),
                    ],
                  ),
                const SizedBox(height: kPaddingS),
                Row(
                  children: [
                    const Icon(
                      HugeIcons.strokeRoundedCall,
                      size: 20,
                    ),
                    const SizedBox(width: kPaddingS),
                    Text(
                      controller.phone.value.isEmpty
                          ? "Phone"
                          : controller.phone.value,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: ThemeColors.white
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
