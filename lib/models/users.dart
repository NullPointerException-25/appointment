import 'dart:io';

import 'package:get/get.dart';

import '../schema/users.dart';

class Users {
  int id;
  String? _imagePath;
  String name;
  String? email;
  Rxn<File> profileImage = Rxn<File>();

  Users({required this.id, imagePath, required this.name, this.email}){
    _imagePath = imagePath;
    if(_imagePath != null){
      profileImage.value = File(_imagePath!);
    }
  }

  factory Users.fromUserSchema(UserSchema userSchema){
    return Users(
      id: userSchema.id,
      imagePath: userSchema.imagePath,
      name: userSchema.name,
      email: userSchema.email
    );
  }

  UserSchema toUserSchema(){
    return UserSchema(
      id: id,
      imagePath: _imagePath,
      name: name,
      email: email
    );
  }


}