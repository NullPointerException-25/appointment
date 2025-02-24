import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:hugeicons/hugeicons.dart';

import '../controllers/home_controller.dart';

class BottomAppbarResponsive extends StatefulWidget {
  const BottomAppbarResponsive({super.key});

  @override
  State<BottomAppbarResponsive> createState() => _BottomAppbarResponsiveState();
}

class _BottomAppbarResponsiveState extends State<BottomAppbarResponsive> {
  final controller = HomeController.to;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _getBottomAppBarHeight());
  }
  final GlobalKey _bottomAppBarKey = GlobalKey();

  void _getBottomAppBarHeight() {
    final RenderBox? renderBox = _bottomAppBarKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
        controller.bottomAppBarHeight.value = renderBox.size.height;
        print(controller.bottomAppBarHeight.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      key: _bottomAppBarKey,
      notchMargin: 8,
      shape: const CircularNotchedRectangle(),
      color: Theme.of(context).colorScheme.onPrimary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: const Icon(HugeIcons.strokeRoundedHome01),
            onPressed: () {
              controller.changePage(0);
            },
          ),
          IconButton(
            icon: const Icon(HugeIcons.strokeRoundedCalendar01),
            onPressed: () {
              controller.changePage(1);
            },
          ),
          const SizedBox(width: 48),
          IconButton(
            icon: const Icon(HugeIcons.strokeRoundedNotification01),
            onPressed: () {
              controller.changePage(2);
            },
          ),
          IconButton(
            icon: const Icon(HugeIcons.strokeRoundedUserGroup),
            onPressed: () {
              controller.changePage(3);
            },
          ),
        ],
      ),
    );
  }
}
