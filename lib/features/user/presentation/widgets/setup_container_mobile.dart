
import 'package:appointments_manager/core/utils/translations.dart';
import 'package:appointments_manager/features/user/presentation/controllers/setup_controller.dart';
import 'package:appointments_manager/features/user/presentation/pagers/email_pager.dart';
import 'package:appointments_manager/features/user/presentation/pagers/image_pager.dart';
import 'package:appointments_manager/features/user/presentation/pagers/name_pager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

class SetupContainerMobile extends StatelessWidget {
  const SetupContainerMobile({super.key});


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded( child: Container()),
        Container(
          constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.7
          ),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
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
                    NamePager(),
                    ImagePager(),
                    EmailPager()
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
