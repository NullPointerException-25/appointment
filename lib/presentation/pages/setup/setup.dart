import 'package:appointments_manager/controllers/setup/pagers/name_pager.dart';
import 'package:appointments_manager/controllers/setup/setup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:mesh_gradient/mesh_gradient.dart';

import '../../../controllers/setup/pagers/image_pager.dart';

class SetupPage extends StatelessWidget {
  const SetupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: AnimatedMeshGradient(
          colors: [
            Theme.of(context).primaryColorDark,
            Theme.of(context).colorScheme.secondary,
            Theme.of(context).colorScheme.primary,
            Theme.of(context).primaryColorDark,
          ],
          options: AnimatedMeshGradientOptions(speed: 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(flex: 2, child: Container()),
              Expanded(
                flex: 3,
                child: Container(
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SetupController.to.step.value != 0?
                              IconButton(
                                  onPressed: SetupController.to.previousStep,
                                  icon: Icon(
                                    HugeIcons.strokeRoundedArrowLeft02,
                                    color: Theme.of(context).primaryColor,
                                  ))
                            : const SizedBox(width: 48,),
                            Text("Let's get started",
                                style: Theme.of(context).textTheme.titleLarge),
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
                          controller: SetupController.to.pageController,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            NamePager(),
                            ImagePager(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
