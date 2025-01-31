import 'package:appointments_manager/core/utils/assets.dart';
import 'package:appointments_manager/core/utils/global_values.dart';
import 'package:appointments_manager/core/utils/translations.dart';
import 'package:appointments_manager/features/client/presentation/controllers/client_query_controller.dart';
import 'package:appointments_manager/features/client/presentation/widgets/client_list_item.dart';
import 'package:appointments_manager/features/client/presentation/widgets/search_bar_header.dart';
import 'package:appointments_manager/home/presentation/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:lottie/lottie.dart';

class ClientsHomePager extends GetView<ClientQueryController> {
  const ClientsHomePager({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SearchBarHeaderSliver(),
        Obx(
          () {
            if (controller.clients.isEmpty) {
              return SliverToBoxAdapter(
                  child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(kPaddingL),
                    child: Text(
                        Translator.clientsNotFound.tr),
                  ),
                  Container(
                    constraints: const BoxConstraints(maxHeight: 300),
                    child: DotLottieLoader.fromAsset(LottieAssets.cat404,
                        frameBuilder: (BuildContext ctx, DotLottie? dotlottie) {
                      if (dotlottie != null) {
                        return Lottie.memory(dotlottie.animations.values.single);
                      } else {
                        return Container();
                      }
                    }),
                  ),
                  ElevatedButton(onPressed: () {
                      HomeController.to.goToCreateClientPage();
                  }, child: Text(Translator.addClient.tr))
                ],
              ));
            }
            return SliverList.builder(
                itemCount: controller.clients.length,
                itemBuilder: (context, index) {
                  final client = controller.clients[index];
                  return ClientListItem(client: client);
                });
          },
        )
      ],
    );
  }
}
