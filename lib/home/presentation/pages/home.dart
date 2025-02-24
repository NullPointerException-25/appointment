
import 'package:appointments_manager/core/widgets/responsive_layout.dart';
import 'package:appointments_manager/home/presentation/controllers/home_controller.dart';
import 'package:appointments_manager/home/presentation/pages/home_mobile.dart';
import 'package:appointments_manager/home/presentation/pages/home_tablet.dart';
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
