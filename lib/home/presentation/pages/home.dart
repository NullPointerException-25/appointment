import 'package:appointments_manager/home/presentation/controllers/home_controller.dart';
import 'package:appointments_manager/home/presentation/pagers/home.dart';
import 'package:appointments_manager/home/presentation/widgets/appbar.dart';
import 'package:appointments_manager/home/presentation/widgets/bottom_appbar_responsive.dart';
import 'package:appointments_manager/home/presentation/widgets/circular_home_floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetResponsiveView<HomeController> {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          floatingActionButton: const SizedBox(
              height: 72,
              width: 72,
              ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          backgroundColor: Theme.of(context).colorScheme.surface,
          bottomNavigationBar: const BottomAppbarResponsive(),
          body: SafeArea(
            child: NestedScrollView(
              floatHeaderSlivers: true,
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
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
                  Container(
                    color: Theme.of(context).colorScheme.surface,
                    child: const Center(
                      child: Text('Profile'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom:44.0),
              child: const CircularHomeFloatingActionButton(),
            )),
      ],
    );
  }
}
