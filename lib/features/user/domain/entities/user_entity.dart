import 'dart:io';

import 'package:appointments_manager/core/abstractions/entity.dart';
import 'package:appointments_manager/features/user/data/models/users_model.dart';
import 'package:get/get.dart';

class UserEntity extends CoreEntity<UserModel> {
  @override
  final int localId;
  Rxn<File> localImage = Rxn<File>();
  Rxn<File> remoteImage = Rxn<File>();
  String imageUrl;
  String name;
  String email;
  bool isCurrentUser;
  @override
  DateTime lastUpdate;
  bool isSetupComplete;
  @override
  String remoteId;

  UserEntity(
      {this.localId = 0,
      required this.name,
      this.email = "",
      this.isCurrentUser = true,
      this.isSetupComplete = false,
      this.remoteId = "",
      required this.lastUpdate,
      this.imageUrl = "",
      String imagePath = ""}) {
    if (imagePath.isNotEmpty) {
      localImage.value = File(imagePath).existsSync() ? File(imagePath) : null;
    }
    if (remoteImage.value != null) {
      imageUrl = remoteImage.value!.path;
    }
  }

  factory UserEntity.fromModel(UserModel model) {
    return UserEntity(
      localId: model.id,
      name: model.name,
      email: model.email,
      isCurrentUser: model.isCurrentUser,
      isSetupComplete: model.isSetupComplete,
      remoteId: model.remoteId,
      lastUpdate: model.lastUpdate,
      imageUrl: model.imageUrl,
      imagePath: model.imagePath,
    );
  }

  @override
  UserModel toModel() {
    return UserModel(
      id: localId,
      name: name,
      email: email,
      isCurrentUser: isCurrentUser,
      isSetupComplete: isSetupComplete,
      remoteId: remoteId,
      imageUrl: imageUrl,
      imagePath: localImage.value?.path ?? "",
    );
  }
}
