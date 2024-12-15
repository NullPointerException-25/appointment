import 'dart:io';

import 'package:appointments_manager/features/user/data/models/users_model.dart';
import 'package:get/get.dart';

class UserEntity {
   final int localId;
   late Rxn<File> localImage;
   late Rxn<File> remoteImage;
   String imageUrl;
   String name;
    String email;
    bool isCurrentUser;
    DateTime lastUpdate;
    bool isSetupComplete;
    String remoteId;


    UserEntity(
        {required this.localId,
        required this.name,
        required this.email,
        required this.isCurrentUser,
        required this.isSetupComplete,
        required this.remoteId,
        required this.lastUpdate,
        required this.imageUrl,
        String imagePath = ""}) {
      if (imagePath.isNotEmpty) {
        localImage = Rxn<File>(File(imagePath));
      } else {
        localImage = Rxn<File>();
      }
      if (remoteImage.value != null) {
        remoteImage = Rxn<File>(File(imagePath));
      } else {
        remoteImage = Rxn<File>();
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
}