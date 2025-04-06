import 'dart:io';

import 'package:appointments_manager/core/abstractions/model.dart';
import 'package:appointments_manager/features/user/domain/entities/user_entity.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:objectbox/objectbox.dart';

@Entity(uid: 1)
class UserModel extends CoreModel<UserEntity> {
  @Id()
  int id = 0;
  String imagePath;
  String imageUrl;
  String name;
  String email;
  bool isCurrentUser;
  @override
  @Transient()
  DateTime lastUpdate = DateTime.now();
  bool isSetupComplete;
  @override
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
      DateTime? lastUpdate,
      this.remoteId = ""}) {
    if (id != null) {
      this.id = id;

    }
    if (lastUpdate != null) {
      this.lastUpdate = lastUpdate;
    }
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

  @override
  int get localId => id;

  @override
  UserEntity toEntity() {
    return UserEntity(
      localId: id,
      name: name,
      email: email,
      isCurrentUser: isCurrentUser,
      isSetupComplete: isSetupComplete,
      remoteId: remoteId,
      lastUpdate: lastUpdate,
      imageUrl: imageUrl,
      imagePath: imagePath,
    );
  }

  @override
  toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

  @override
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      imagePath: json['imagePath'] as String,
      imageUrl: json['imageUrl'] as String,
      isSetupComplete: json['isSetupComplete'] as bool,
      remoteId: json['remoteId'] as String,
      lastUpdate: DateTime.parse((json['lastUpdate'] as String)),
    );
  }
}
