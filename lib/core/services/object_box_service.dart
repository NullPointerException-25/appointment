import 'dart:io';

import 'package:appointments_manager/core/services/profile_service.dart';
import 'package:appointments_manager/objectbox.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

/// Use [ObjectBoxService.to._store] to access the store,
/// This service manages the ObjectBox store for the specific user profile.
/// Whenever the profile changes, the store is updated, there´s no need to manually close the store for any child service.
class ObjectBoxService extends GetxService {
  final Rxn<Store> store = Rxn<Store>();

  static ObjectBoxService get to => Get.find<ObjectBoxService>();

  String get profileFolder => "user${ProfileService.to.profile.value}";

  Future<ObjectBoxService> init(int profile) async {
    Directory docsDir = await getApplicationDocumentsDirectory();
    if (Platform.isMacOS || Platform.isLinux || Platform.isWindows) {
      docsDir = await getApplicationSupportDirectory();
    }
    String path = p.join(docsDir.path, profileFolder);


    requestToCloseDatabase();

    if (store.value == null || store.value!.isClosed()) {
      store.value = await openStore(directory: path);
    }
    debugPrint("ObjectBoxService initialized in: $path");
    return this;
  }

  void requestToCloseDatabase() {
    if (store.value != null && !store.value!.isClosed()) {
      store.value?.close();
      store.value = null;
    }
  }
}
