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
import '../widgets/appbar_small.dart';

class HomeDesktopPage extends GetResponsiveView<HomeController> {
  HomeDesktopPage({super.key});

  List<Widget> pagers(BuildContext context) {
    return [
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
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Row(
          children: [
            Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HomeAppBarSmall(),
                  Expanded(
                    child: NavigationRail(
                      onDestinationSelected: (value) {
                        controller.selectedIndex.value = value;
                        controller.changePage(value);
                      },
                      extended: true,
                      destinations: [
                        NavigationRailDestination(
                          icon: Icon(HugeIcons.strokeRoundedHome01,
                              size: kIconSize,
                              color: Theme.of(context).brightness == Brightness.dark
                                  ? ThemeColors.white
                                  : ThemeColors.dark),
                          label: Text(Translator.home.tr,
                              style: Theme.of(context).textTheme.bodyLarge),
                        ),
                        NavigationRailDestination(
                          icon: Icon(HugeIcons.strokeRoundedCalendar01,
                              size: kIconSize,
                              color: Theme.of(context).brightness == Brightness.dark
                                  ? ThemeColors.white
                                  : ThemeColors.dark),
                          label: Text(Translator.calendar.tr,
                              style: Theme.of(context).textTheme.bodyLarge),
                        ),
                        NavigationRailDestination(
                          icon: Icon(HugeIcons.strokeRoundedNotification01,
                              size: kIconSize,
                              color: Theme.of(context).brightness == Brightness.dark
                                  ? ThemeColors.white
                                  : ThemeColors.dark),
                          label: Text(Translator.notifications.tr,
                              style: Theme.of(context).textTheme.bodyLarge),
                        ),
                        NavigationRailDestination(
                          icon: Icon(HugeIcons.strokeRoundedUser,
                              size: kIconSize,
                              color: Theme.of(context).brightness == Brightness.dark
                                  ? ThemeColors.white
                                  : ThemeColors.dark),
                          label: Text(Translator.clients.tr,
                              style: Theme.of(context).textTheme.bodyLarge),
                        ),
                      ],
                      selectedIndex: controller.selectedIndex.value,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  child: ObxValue<RxInt>(
                      (value) => pagers(context)[controller.selectedIndex.value],
                      controller.selectedIndex),
                )
              ],
            )),
          ],
        ),
      ),
    );
  }
}
