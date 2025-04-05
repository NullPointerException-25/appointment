
import 'package:appointments_manager/core/utils/global_values.dart';
import 'package:appointments_manager/core/utils/translations.dart';
import 'package:appointments_manager/features/user/presentation/controllers/setup_controller.dart';
import 'package:appointments_manager/features/user/presentation/pagers/login_pager.dart';
import 'package:appointments_manager/features/user/presentation/pagers/setup_pager.dart';
import 'package:appointments_manager/features/user/presentation/pagers/image_pager.dart';
import 'package:appointments_manager/features/user/presentation/pagers/name_pager.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:hugeicons/hugeicons.dart';

class SetupContainerDesktop extends StatelessWidget {
  const SetupContainerDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(flex: 2, child: Container()),
        Container(
          padding: const EdgeInsets.all(kPaddingXXL),
          height: double.infinity,
          width: MediaQuery.of(context).size.width * 0.3,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(kCornerRadiusXL),
              bottomLeft: Radius.circular(kCornerRadiusXL),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Obx(
                    () => Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceAround,
                  children: [
                    SetupController.to.step.value != 0
                        ? IconButton(
                        onPressed:
                        SetupController.to.previousStep,
                        icon: Icon(
                          HugeIcons
                              .strokeRoundedArrowLeft02,
                          color: Theme.of(context)
                              .primaryColor,
                        ))
                        : const SizedBox(
                      width: 48,
                    ),
                    Text(Translator.letsGetStarted.tr,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge),
                    const SizedBox(
                      width: 48,
                      height: 48,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: PageView(
                  allowImplicitScrolling: false,
                  controller: SetupController.to.initPageController(),
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    LoginPager(),
                    NamePager(),
                    ImagePager(),
                    SignUpPager()
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
