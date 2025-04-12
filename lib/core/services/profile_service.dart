
import 'dart:io';

import 'package:appointments_manager/core/services/object_box_service.dart';
import 'package:appointments_manager/objectbox.g.dart';
import 'package:appointments_manager/features/user/data/models/users_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class ProfileService extends GetxService {
  final RxInt profile = 0.obs;
  late final Rx<UserModel> user;

  static ProfileService get to => Get.find<ProfileService>();
  late final Rx<Store> store;

   Future<ProfileService> init() async {
    Directory directory = await getApplicationDocumentsDirectory();
    if(Platform.isMacOS || Platform.isLinux || Platform.isWindows){
      directory = await getApplicationSupportDirectory();
    }

    final dbPath = p.join(directory.path, 'default');
    debugPrint("ProfileService initialized in: $dbPath");
    await Directory(dbPath).create(recursive: true);
    store = (await openStore(directory: dbPath)).obs;
    final getUsers = store.value.box<UserModel>().getAll();
    if (getUsers.isEmpty) {
      createDefaultUser();
      return this;
    }
    final currentUser =
        getUsers.firstWhereOrNull((element) => element.isCurrentUser);
    if (currentUser != null) {
      await changeProfile(currentUser.id);
      return this;
    }
    await changeProfile(getUsers.first.id);
    return this;
  }

  Future<void> changeProfile(int id) async {
    final currentUser = profile.value ==0? null: store.value.box<UserModel>().get(profile.value);
    if(currentUser != null) {
      currentUser.isCurrentUser = false;
      store.value.box<UserModel>().put(currentUser);
    }
    profile.value = id;
    await ObjectBoxService.to.init(profile.value);

    try{
      user = store.value.box<UserModel>().get(profile.value)!.obs;
    }
    catch (e){
      user.value = store.value.box<UserModel>().get(profile.value)!;
    }
    finally {
      store.value
          .box<UserModel>()
          .put(store.value.box<UserModel>().get(id)!..isCurrentUser = true);
    }
  }

  Future<void> createDefaultUser() async {
    int id = store.value.box<UserModel>().put(UserModel(
          id: 0,
          name: '',
          imagePath: "",
          email: "",
          isCurrentUser: true,
        ));
    await changeProfile(id);
  }
}
