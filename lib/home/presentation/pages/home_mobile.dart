import 'package:appointments_manager/core/utils/colors.dart';
import 'package:appointments_manager/features/client/presentation/pagers/clients_home_pager.dart';
import 'package:appointments_manager/home/presentation/controllers/home_controller.dart';
import 'package:appointments_manager/home/presentation/pagers/home_pager.dart';
import 'package:appointments_manager/home/presentation/widgets/appbar.dart';
import 'package:appointments_manager/home/presentation/widgets/bottom_appbar_responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/circular_home_floating_action_button.dart';

class HomeMobilePage extends GetResponsiveView<HomeController> {
   HomeMobilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          floatingActionButton: const SizedBox(
            height: 72,
            width: 72,
          ),
          floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,
          backgroundColor: Theme.of(context).colorScheme.surface,
         bottomNavigationBar: const BottomAppbarResponsive(),
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
                  const ClientsHomePager(),
                ],
              ),
            ),
          ),
        ),
        Obx(() {
          return Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              key: const Key('circular_menu'),
              onTap: () {
                controller.circularMenuKey.currentState!.reverseAnimation();
                controller.isCircularMenuOpened.value = false;
              },
              child: Container(
                  height: controller.isCircularMenuOpened.value
                      ? double.maxFinite
                      : controller.bottomAppBarHeight.value !=null? controller.bottomAppBarHeight.value!+40: 120,
                  width: controller.isCircularMenuOpened.value
                      ? double.maxFinite
                      : 90,
                  decoration: BoxDecoration(
                      color: controller.isCircularMenuOpened.value
                          ? ThemeColors.dark.withValues(alpha: 0.2)
                          : Colors.transparent),
                  child:  Container(
                    padding:  EdgeInsets.only(bottom: controller.bottomAppBarHeight.value !=null? controller.bottomAppBarHeight.value!-36: 48,),
                    child: const CircularHomeFloatingActionButton(),
                ),
              ),
            ),
          );
        }),
      ],
    );
  }
}
