
import 'package:appointments_manager/core/utils/colors.dart';
import 'package:appointments_manager/core/widgets/responsive_layout.dart';
import 'package:appointments_manager/features/user/presentation/controllers/login_controller.dart';
import 'package:appointments_manager/features/user/presentation/controllers/setup_controller.dart';
import 'package:appointments_manager/features/user/presentation/widgets/setup_container_desktop.dart';
import 'package:appointments_manager/features/user/presentation/widgets/setup_container_mobile.dart';
import 'package:appointments_manager/features/user/presentation/widgets/setup_container_tablet.dart';
import 'package:flutter/material.dart';
import 'package:mesh_gradient/mesh_gradient.dart';



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
          options: AnimatedMeshGradientOptions(speed: 2),
          child: const ResponsiveLayout(
            desktop: SetupContainerDesktop(),
            mobile: SetupContainerMobile(),
            tablet: SetupContainerTablet(),
          ),
        ),
      ),
    );
  }
}
