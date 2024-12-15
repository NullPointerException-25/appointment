import 'package:appointments_manager/controllers/home/home_controller.dart';
import 'package:appointments_manager/presentation/pages/home/pagers/home.dart';
import 'package:appointments_manager/presentation/pages/home/widgets/appbar.dart';
import 'package:appointments_manager/presentation/pages/home/widgets/bottom_appbar_responsive.dart';
import 'package:appointments_manager/presentation/pages/home/widgets/circular_home_floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

class HomePage extends GetResponsiveView<HomeController> {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: SizedBox(
          height: 72,
          width: 72,
          child: CircularHomeFloatingActionButton(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const BottomAppbarResponsive(),
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: SafeArea(
          child: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                const HomeAppBar(),
              ];
            },
            body: PageView(
            //  physics: const NeverScrollableScrollPhysics(),
              controller: controller.pageController,
              children: [
                const HomePager(),
                Container(
                  color: Theme.of(context).colorScheme.surface,
                  child: const Center(
                    child: Text('Calendar'),
                  ),
                ),
                Container(
                  color: Theme.of(context).colorScheme.surface,
                  child: const Center(
                    child: Text('Notifications'),
                  ),
                ),
                Container(
                  color: Theme.of(context).colorScheme.surface,
                  child: const Center(
                    child: Text('Profile'),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
