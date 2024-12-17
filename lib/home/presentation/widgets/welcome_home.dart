import 'package:appointments_manager/home/presentation/controllers/home_controller.dart';
import 'package:appointments_manager/core/utils/colors.dart';
import 'package:appointments_manager/core/utils/global_values.dart';
import 'package:appointments_manager/core/utils/translations.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:mesh_gradient/mesh_gradient.dart';

class WelcomeHomeSection extends StatelessWidget {
  const WelcomeHomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kPaddingM),
      child: ClipRRect(
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
          options: AnimatedMeshGradientOptions(
            speed: 1,
          ),
          child: Container(
            height: 200,
            width: double.infinity,
            padding: const EdgeInsets.all(kPaddingM),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Translator.welcome.tr,
                      style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                            color: ThemeColors.white,
                          ),
                    ),
                    Obx(
                      () =>  Text(
                        HomeController.to.user.value?.name?? '',
                        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                              color: ThemeColors.white,
                            ),
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Text(
                          Translator.todaysTotalAppointments.tr,
                          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                                color: ThemeColors.white,
                              ),
                        ),
                        const SizedBox(width: kPaddingS),
                        Text(
                          '123',
                          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                                color: ThemeColors.white,
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                      ],
                    ),
                    const SizedBox(height: kPaddingS),
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
