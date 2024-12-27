import 'package:appointments_manager/core/utils/colors.dart';
import 'package:appointments_manager/core/utils/global_values.dart';
import 'package:appointments_manager/core/utils/translations.dart';
import 'package:appointments_manager/features/client/domain/entities/client_entity.dart';
import 'package:appointments_manager/features/client/presentation/controllers/client_query_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

class ClientListItem extends GetView<ClientQueryController> {
  const ClientListItem({super.key, required this.client});

  final ClientEntity client;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kPaddingM),
      child: ExpansionTile(
        collapsedBackgroundColor:
            Theme.of(context).brightness == Brightness.dark
                ? ThemeColors.dark
                : ThemeColors.white,
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? ThemeColors.dark
            : ThemeColors.white,
        collapsedShape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(kCornerRadiusM))),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(kCornerRadiusM))),
        iconColor: Theme.of(context).brightness == Brightness.dark
            ? ThemeColors.white
            : ThemeColors.dark,
        collapsedIconColor: Theme.of(context).brightness == Brightness.dark
            ? ThemeColors.white
            : ThemeColors.dark,
        leading: client.image.value != null
            ? CircleAvatar(
                radius: kIconSizeL / 2,
                backgroundImage: FileImage(client.image.value!),
              )
            : Icon(
                HugeIcons.strokeRoundedUser,
                color: Theme.of(context).brightness == Brightness.dark
                    ? ThemeColors.white
                    : ThemeColors.dark,
                size: kIconSizeM,
              ),
        title: Text(
          client.name,
          style: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark
                  ? ThemeColors.white
                  : ThemeColors.dark,
              overflow: TextOverflow.fade),
        ),
        childrenPadding: const EdgeInsets.symmetric(horizontal: kPaddingL),
        children: [
          InkWell(
            onTap: () {
              controller.goToClientDetailsPage(client);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: kPaddingS),
              child: Row(
                children: [
                  Icon(
                    HugeIcons.strokeRoundedView,
                    size: kIconSize,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? ThemeColors.white
                        : ThemeColors.dark,
                  ),
                  const SizedBox(
                    width: kPadding,
                  ),
                  Text(Translator.viewProfile.tr)
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: kPaddingS),
              child: Row(
                children: [
                  Icon(
                    HugeIcons.strokeRoundedCall,
                    size: kIconSize,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? ThemeColors.white
                        : ThemeColors.dark,
                  ),
                  const SizedBox(
                    width: kPadding,
                  ),
                  Text(Translator.quickCall.tr)
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              controller.goToCreateAppointment(client);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: kPaddingS),
              child: Row(
                children: [
                  Icon(
                    HugeIcons.strokeRoundedCalendarAdd02,
                    size: kIconSize,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? ThemeColors.white
                        : ThemeColors.dark,
                  ),
                  const SizedBox(
                    width: kPadding,
                  ),
                  Text(Translator.scheduleAppointment.tr)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
