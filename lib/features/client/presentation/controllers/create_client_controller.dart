import 'dart:io';
import 'package:appointments_manager/features/client/domain/entities/client_entity.dart';
import 'package:appointments_manager/features/client/domain/usecases/create_client.dart';
import 'package:appointments_manager/features/client/presentation/abstractions/controller_card_previewable.dart';
import 'package:appointments_manager/features/client/presentation/widgets/snackbar_client_saved.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateClientController extends GetxController implements ControllerClientCardPreviewable {
  CreateClientController();

  @override
  final image = Rxn<File>();
  @override
  final name = RxString("");
  @override
  final email = RxString("");
  @override
  final phone = RxString("");
  @override
  final description = RxString("");
  final _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;

  void save() async {
    if (_formKey.currentState!.validate()) {
      await CreateClientUseCase().execute(
        ClientEntity(
          name: name.value,
          email: email.value,
          phone: phone.value,
          description: description.value,
          localImagePath: image.value?.path ?? "",
        ),
      );


      Get.showSnackbar(const SnackBarClientSaved().build(Get.context!));
    }
  }
}
