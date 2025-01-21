import 'dart:io';

import 'package:appointments_manager/core/services/object_box_service.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as p;

class DeviceStorageUserDatastore extends GetxService {
  static DeviceStorageUserDatastore get to =>
      Get.find<DeviceStorageUserDatastore>();
  late final ObjectBoxService _objectBoxService;
  final String profileImageFolder = "profile_image";
  DeviceStorageUserDatastore({ObjectBoxService? objectBoxService}) {
    _objectBoxService = objectBoxService ?? ObjectBoxService.to;
  }

  Future<String> saveProfileImage(String imagePath) async {
    final folder = _objectBoxService.profileFolder;
    final profileImage = p.join(folder, profileImageFolder);
    final file = File(imagePath);
    final fileName = p.basename(file.path);
    final newFile = await file.copy('$profileImage/$fileName');
    return newFile.path;
  }
}
