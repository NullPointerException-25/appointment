
import 'package:appointments_manager/core/utils/colors.dart';
import 'package:appointments_manager/core/utils/global_values.dart';
import 'package:appointments_manager/features/user/presentation/controllers/setup_controller.dart';
import 'package:appointments_manager/features/user/presentation/widgets/setup_container_desktop.dart';
import 'package:appointments_manager/features/user/presentation/widgets/setup_container_mobile.dart';
import 'package:appointments_manager/features/user/presentation/widgets/setup_container_tablet.dart';
import 'package:flutter/material.dart';
import 'package:mesh_gradient/mesh_gradient.dart';
import 'package:responsive_framework/responsive_framework.dart';



class SetupPage extends StatelessWidget {
   SetupPage({super.key});
  final pageController = PageController(initialPage: SetupController.to.step.value);
  @override
  Widget build(BuildContext context) {
    SetupController.to.loadPreviousData();
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: AnimatedMeshGradient(
          colors: [
            Theme.of(context).primaryColorDark,
            Theme.of(context).colorScheme.secondary,
            ThemeColors.lighterBlue,
            Theme.of(context).primaryColorDark,
          ],
          seed: 10,
          options: AnimatedMeshGradientOptions(speed: 1),
          child: _getSetupContainer(context),
        ),
      ),
    );
  }

  Widget _getSetupContainer(BuildContext context) {
    if(ResponsiveMedia(context).isSmallerThan(AspectRatioResponsive.fourThree)){
      return const SetupContainerMobile();
    }
    if(ResponsiveMedia(context).isSmallerThan(AspectRatioResponsive.twentyOneNine) && ResponsiveBreakpoints.of(context).isTablet){
      return const SetupContainerTablet();
    }
    return const SetupContainerDesktop();
  }
}
