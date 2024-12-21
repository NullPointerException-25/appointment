import 'dart:io';

import 'package:appointments_manager/features/client/domain/entities/client_entity.dart';
import 'package:appointments_manager/features/client/presentation/abstractions/controller_card_previewable.dart';
import 'package:get/get.dart';

class ClientDetailsController extends GetxController
    implements ControllerClientCardPreviewable {
  ClientEntity client = Get.arguments as ClientEntity;
  @override
  final RxString name = "".obs;
  @override
  final Rxn<File> image = Rxn<File>();
  @override
  final RxString description = RxString("");
  @override
  final RxString phone = "".obs;
  @override
  final RxString email = "".obs;

  @override
  void onInit() {
    name.value = client.name;
    image.value = client.image.value;
    description.value = client.description;
    phone.value = client.phone;
    email.value = client.email;
    super.onInit();
  }
}
