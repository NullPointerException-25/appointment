
import 'dart:io';

import 'package:appointments_manager/objectbox.g.dart';
import 'package:appointments_manager/features/user/data/models/users_model.dart';
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
      changeProfile(currentUser.id);
      return this;
    }
    changeProfile(getUsers.first.id);
    return this;
  }

  void changeProfile(int id) {
    profile.value = id;
    store.value
        .box<UserModel>()
        .put(store.value.box<UserModel>().get(id)!..isCurrentUser = true);
    final otherUser = store.value.box<UserModel>().get(profile.value);
    if (otherUser != null && id != profile.value) {
      store.value.box<UserModel>().put(otherUser..isCurrentUser = false);
    }
    user = store.value.box<UserModel>().get(profile.value)!.obs;
  }

  void createDefaultUser() {
    int id = store.value.box<UserModel>().put(UserModel(
          id: 0,
          name: '',
          imagePath: "",
          email: "",
          isCurrentUser: true,
        ));
    changeProfile(id);
  }
}
