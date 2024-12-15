import 'dart:io';

import 'package:appointments_manager/features/user/domain/entities/user_entity.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:objectbox/objectbox.dart';

@Entity(uid: 1)
class UserModel {
  @Id()
  int id = 0;
  String imagePath;
  String imageUrl;
  String name;
  String email;
  bool isCurrentUser;
  DateTime lastUpdate = DateTime.now();
  bool isSetupComplete;
  String remoteId;

  @Transient()
  @Deprecated("Use file.value for UserEntity")
  late final Rxn<File> file = Rxn<File>();

  UserModel(
      {int? id,
      required this.name,
      this.email = "",
      this.imagePath = "",
      this.isCurrentUser = false,
      this.isSetupComplete = false,
      this.imageUrl = "",
      this.remoteId = ""}) {
    if (id != null) {
      this.id = id;
    }
    file.value = imagePath.isNotEmpty ? File(imagePath) : null;
  }

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      id: entity.localId,
      imagePath: entity.localImage.value?.path ?? "",
      imageUrl: entity.imageUrl,
      name: entity.name,
      email: entity.email,
      isCurrentUser: entity.isCurrentUser,
      isSetupComplete: entity.isSetupComplete,
      remoteId: entity.remoteId,
    );
  }
}
