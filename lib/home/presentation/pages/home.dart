import 'package:appointments_manager/core/utils/colors.dart';
import 'package:appointments_manager/core/widgets/responsive_layout.dart';
import 'package:appointments_manager/features/client/presentation/pagers/clients_home_pager.dart';
import 'package:appointments_manager/home/presentation/controllers/home_controller.dart';
import 'package:appointments_manager/home/presentation/pagers/home_pager.dart';
import 'package:appointments_manager/home/presentation/pages/home_mobile.dart';
import 'package:appointments_manager/home/presentation/pages/home_tablet.dart';
import 'package:appointments_manager/home/presentation/widgets/appbar.dart';
import 'package:appointments_manager/home/presentation/widgets/bottom_appbar_responsive.dart';
import 'package:appointments_manager/home/presentation/widgets/circular_home_floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetResponsiveView<HomeController> {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        mobile: HomeMobilePage(),
        tablet: const HomeTabletPage(),
        desktop: HomeMobilePage());
  }
}
