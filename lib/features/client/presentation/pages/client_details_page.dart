import 'package:appointments_manager/core/utils/colors.dart';
import 'package:appointments_manager/core/utils/global_values.dart';
import 'package:appointments_manager/features/client/presentation/controllers/client_details_controller.dart';
import 'package:appointments_manager/features/client/presentation/widgets/client_card.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class ClientDetailsPage extends GetView<ClientDetailsController> {
  const ClientDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          actions: [
            IconButton(
                onPressed: () {},
                icon: HugeIcon(
                    icon: HugeIcons.strokeRoundedPencilEdit01,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? ThemeColors.white
                        : ThemeColors.dark))
          ],
        ),
        SliverPadding(
          padding: const EdgeInsets.all(kPaddingM),
          sliver: SliverToBoxAdapter(
              child:
                  ClientCard<ClientDetailsController>(controller: controller)),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(kPaddingM),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ThemeColors.darkBlue),
                  onPressed: () {},
                  icon: const Icon(
                    HugeIcons.strokeRoundedFileAdd,
                    size: kIconSize,
                    color: ThemeColors.white,
                  ),
                  label: const Text("Add files"),
                )
              ],
            ),
          ),
        ),
        Obx(() => SliverToBoxAdapter(child: Text(controller.description.value)))
      ],
    ));
  }
}
