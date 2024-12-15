
import 'package:appointments_manager/core/utils/global_values.dart';
import 'package:appointments_manager/core/utils/translations.dart';
import 'package:appointments_manager/features/user/presentation/controllers/setup_controller.dart';
import 'package:appointments_manager/features/user/presentation/pagers/email_pager.dart';
import 'package:appointments_manager/features/user/presentation/pagers/image_pager.dart';
import 'package:appointments_manager/features/user/presentation/pagers/name_pager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

class SetupContainerTablet extends StatelessWidget {
  const SetupContainerTablet({super.key});

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(flex: 2, child: Container()),
        Container(
          padding: const EdgeInsets.symmetric(vertical: kPaddingS, horizontal: kPaddingM),
          height: double.infinity,
          width: MediaQuery.of(context).size.width * 0.5,
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
                  scrollDirection: Axis.vertical,
                  controller: SetupController.to.initPageController(),
                  physics: const NeverScrollableScrollPhysics(),
                  children:  [
                    SingleChildScrollView(
                      child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.8,
                          child: const NamePager()),
                    ),
                    SingleChildScrollView(
                      child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.8,
                          child: const ImagePager()),
                    ),
                    SingleChildScrollView(
                      child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.8,
                          child: const EmailPager()),
                    )
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
