import 'dart:io';

import 'package:appointments_manager/core/utils/routes.dart';
import 'package:appointments_manager/features/client/domain/entities/client_entity.dart';
import 'package:appointments_manager/features/client/domain/repositories/clients_repository.dart';
import 'package:appointments_manager/features/client/presentation/widgets/snackbar_client_saved.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateClientController extends GetxController {
  final ClientsRepository repository;

  CreateClientController({required this.repository});

  final image = Rxn<File>();
  final name = RxString("");
  final email = RxString("");
  final phone = RxString("");
  final description = RxString("");
  final _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;

  void save() async {
    if (_formKey.currentState!.validate()) {
       await repository.saveClient(
        ClientEntity(
          name: name.value,
          email: email.value,
          phone: phone.value,
          description: description.value,
          localImagePath: image.value?.path?? "",
        ),
      );

       Get.back();
       Get.showSnackbar(const SnackBarClientSaved().build(Get.context!));


    }
  }
}
