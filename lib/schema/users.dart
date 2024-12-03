
import 'dart:io';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:objectbox/objectbox.dart';

@Entity(uid: 1)
class UserSchema {
  @Id()
  int id=0;
  String? imagePath;
  String name;
  String? email;
  bool isCurrentUser;
  bool isSetupComplete;

  @Transient()
  late final Rxn<File> file= Rxn<File>();

  UserSchema({int? id, required this.name, this.email, this.imagePath, this.isCurrentUser=false, this.isSetupComplete=false}){
    if(id!=null){
      this.id= id;
    }
    file.value= imagePath!=null? File(imagePath!): null;
  }
}