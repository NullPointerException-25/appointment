import 'dart:io';

import 'package:appointments_manager/core/services/object_box_service.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

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
    final docsDir = await getApplicationDocumentsDirectory();
    final profileImagePath = p.join(docsDir.path, folder, profileImageFolder);
    // Create the directory if it doesn't exist
    await _createDirectory(profileImagePath);
    final file = File(imagePath);
    final fileName = p.basename(file.path);
    final newFile = await file.copy('$profileImagePath/$fileName');
    return newFile.path;
  }

  Future<void> _createDirectory(String path) async {
    final directory = Directory(path);
    if (!await directory.exists()) {
      await directory.create(recursive: true);
    }
  }
}
