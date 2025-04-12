import 'package:appointments_manager/home/presentation/controllers/home_controller.dart';
import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class CircularHomeFloatingActionButton extends StatefulWidget{
 const  CircularHomeFloatingActionButton({super.key});

  @override
  State<CircularHomeFloatingActionButton> createState() => _CircularHomeFloatingActionButtonState();
}

class _CircularHomeFloatingActionButtonState extends State<CircularHomeFloatingActionButton> {

  final controller = HomeController.to;

  @override
  void initState() {
    super.initState();
    controller.circularKey = GlobalKey<CircularMenuState>();
  }

  @override
  Widget build(BuildContext context) {
    return CircularMenu(
        key: controller.circularKey,
        toggleButtonOnPressed: (){
          controller.isCircularMenuOpened.value =
          !controller.isCircularMenuOpened.value;
        },
        toggleButtonAnimatedIconData: AnimatedIcons.menu_close,
        animationDuration: const Duration(milliseconds: 200),
        toggleButtonColor: Theme.of(context).colorScheme.primary,
        toggleButtonSize: 32,
        curve: Curves.linear,
        reverseCurve: Curves.easeInOut,
        endingAngleInRadian: (315 * 6.28) / 360,
        // 315 degrees
        startingAngleInRadian: (225 * 6.28) / 360,
        // 225 degrees
        toggleButtonBoxShadow: const [],
        items: [
          CircularMenuItem(
            boxShadow: const [],
            color: Theme.of(context).colorScheme.primary,
            icon: HugeIcons.strokeRoundedUserAdd01,
            onTap: () {
              HomeController.to.goToCreateClientPage();
            },
          ),
          CircularMenuItem(
            color: Theme.of(context).colorScheme.primary,
            icon: HugeIcons.strokeRoundedCalendarAdd01,
            boxShadow: const [],
            onTap: () {
              HomeController.to.goToCreateAppointmentPage();
            },
          ),
          CircularMenuItem(
            boxShadow: const [],
            color: Theme.of(context).colorScheme.primary,
            icon: HugeIcons.strokeRoundedFileAdd,
            onTap: () {},
          ),
        ]);
  }
}
