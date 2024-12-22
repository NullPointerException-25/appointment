
import 'dart:io';

import 'package:appointments_manager/core/abstractions/entity.dart';
import 'package:appointments_manager/features/client/data/models/client.dart';
import 'package:get/get.dart';

class ClientEntity extends CoreEntity<ClientModel> {
  @override
  int localId;
  @override
  String remoteId;
  @override
  late DateTime lastUpdate;
  String name;
  String email;
  String phone;
  String localImagePath;
  String urlImage;
  String description;
  Rxn<File> image= Rxn<File>();

  ClientEntity({
    this.localId = 0,
    this.remoteId = "",
    DateTime? lastUpdate,
    required this.name,
    this.description = "",
    this.urlImage = "",
    this.email = "",
    this.phone = "",
    this.localImagePath = "",
  }) {
    image.value= localImagePath.isNotEmpty? File(localImagePath):null;

      this.lastUpdate=lastUpdate??DateTime.now();

  }

  @override
  ClientModel toModel() {
    return ClientModel(
      id: localId,
      name: name,
      email: email,
      phone: phone,
      imagePath: localImagePath,
      urlImage: urlImage,
      lastUpdate: lastUpdate,
      description: description,
      remoteId: remoteId,
    );
  }

}
