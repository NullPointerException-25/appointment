import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/global_values.dart';
import '../../../core/utils/translations.dart';
import '../../../features/client/presentation/pagers/clients_home_pager.dart';
import '../controllers/home_controller.dart';
import '../pagers/home_pager.dart';
import '../widgets/appbar.dart';

class HomeDesktopPage extends GetResponsiveView<HomeController> {
   HomeDesktopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme
          .of(context)
          .colorScheme
          .surface,
      body: SafeArea(
        child: Row(
          children: [
            Obx(
              () =>  NavigationRail(
                onDestinationSelected: (value) {
                  controller.selectedIndex.value=value;
                  controller.changePage(value);
                },
                extended: true,
                destinations: [
                  NavigationRailDestination(
                    icon: Icon(HugeIcons.strokeRoundedHome01,
                        size: kIconSize,
                        color: Theme
                            .of(context)
                            .brightness == Brightness.dark
                            ? ThemeColors.white
                            : ThemeColors.dark),
                    label: Text(Translator.home.tr, style: Theme
                        .of(context)
                        .textTheme
                        .bodyLarge),
                  ),
                  NavigationRailDestination(
                    icon: Icon(HugeIcons.strokeRoundedCalendar01,
                        size: kIconSize,
                        color: Theme
                            .of(context)
                            .brightness == Brightness.dark
                            ? ThemeColors.white
                            : ThemeColors.dark),
                    label: Text(Translator.calendar.tr, style: Theme
                        .of(context)
                        .textTheme
                        .bodyLarge),
                  ),
                ],
                selectedIndex: controller.selectedIndex.value,
              ),
            ),
            Expanded(
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
                      color: Theme
                          .of(context)
                          .colorScheme
                          .surface,
                      child: const Center(
                        child: Text('Calendar'),
                      ),
                    ),
                    Container(
                      color: Theme
                          .of(context)
                          .colorScheme
                          .surface,
                      child: const Center(
                        child: Text('Notifications'),
                      ),
                    ),
                    const ClientsHomePager(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
