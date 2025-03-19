import 'package:appointments_manager/core/utils/colors.dart';
import 'package:appointments_manager/core/utils/global_values.dart';
import 'package:appointments_manager/core/utils/translations.dart';
import 'package:appointments_manager/core/widgets/text_form_field_core.dart';
import 'package:appointments_manager/features/appointment/presentation/controllers/create_appointment_controller.dart';
import 'package:appointments_manager/features/client/domain/entities/client_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

class ClientSearcherTextField extends GetView<CreateAppointmentController> {
  const ClientSearcherTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TypeAheadField<ClientEntity>(
      controller: controller.clientNameSearchTextController,
      focusNode: controller.clientNameSearchFocusNode,
      itemSeparatorBuilder: (context, value) => const SizedBox(
        height: kPaddingS,
      ),
      itemBuilder: (context, value) => ListTile(
        onTap: () {
          controller.selectClient(value);
        },
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(kCornerRadius))),
        tileColor: Theme.of(context).brightness == Brightness.dark
            ? ThemeColors.darkBlue
            : ThemeColors.white,
        leading: value.image.value == null
            ? Icon(
                HugeIcons.strokeRoundedUser,
                color: Theme.of(context).brightness == Brightness.dark
                    ? ThemeColors.white
                    : ThemeColors.dark,
              )
            : CircleAvatar(
                radius: kIconSizeM / 2,
                backgroundImage: FileImage(value.image.value!),
              ),
        title: Text(
          value.name,
          style: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark
                  ? ThemeColors.white
                  : ThemeColors.dark),
        ),
      ),
      onSelected: (value) {

      },
      emptyBuilder: (context) {
        return ListTile(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(kCornerRadius))),
          tileColor: Theme.of(context).brightness == Brightness.dark
              ? ThemeColors.darkBlue
              : ThemeColors.lightBlue,
          leading: Icon(
            HugeIcons.strokeRoundedUser,
            color: Theme.of(context).brightness == Brightness.dark
                ? ThemeColors.white
                : ThemeColors.dark,
          ),
          title: Text(
            Translator.noClientsFound.tr,
            style: TextStyle(
                color: Theme.of(context).brightness == Brightness.dark
                    ? ThemeColors.white
                    : ThemeColors.dark),
          ),
          subtitle: Text(
            Translator.tapToAddClient.tr,
            style: TextStyle(
                color: Theme.of(context).brightness == Brightness.dark
                    ? ThemeColors.white
                    : ThemeColors.dark),
          ),
        );
      },
      builder: (context, controller, focusNode) => Obx(
        () => TextFormFieldCore(
          validator: (value){
            if(this.controller.selectedClient.value==null){
              return Translator.pleaseSelectAClient.tr;
            }
            return null;
          },
            prefixIcon: this.controller.selectedClient.value == null ||
                    this.controller.selectedClient.value!.image.value == null
                ? HugeIcon(
                    icon: HugeIcons.strokeRoundedUser,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? ThemeColors.white
                        : ThemeColors.dark)
                : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                      backgroundImage: FileImage(
                          this.controller.selectedClient.value!.image.value!),
                    ),
                ),
            textInputAction: TextInputAction.next,
            controller: controller,
            focusNode: focusNode,
            onFieldSubmitted: (p0) {
              focusNode.unfocus();
            },
            hintText: Translator.clientName.tr),
      ),
      suggestionsCallback: (search) async {
        await controller.fetchClients();
        return controller.clients;
      },
    );
  }
}
