import 'dart:io';

import 'package:appointments_manager/features/user/data/datasource/device_storage_user_datastore.dart';
import 'package:appointments_manager/features/user/data/datasource/local_user_datasource.dart';
import 'package:appointments_manager/features/user/domain/repositories/user_repository.dart';
import 'package:appointments_manager/features/user/data/models/users_model.dart';
import 'package:get/get.dart';

class UserRepositoryImpLocal extends GetxService implements UserRepository {
  static UserRepositoryImpLocal get to =>
      Get.find<UserRepositoryImpLocal>();
  late final LocalUserDatasource _localUserDatasource;
  late final DeviceStorageUserDatastore _deviceStorageUserDatastore;

  UserRepositoryImpLocal(
      {LocalUserDatasource? localDatasource,
      DeviceStorageUserDatastore? deviceStorageUserDatastore}) {
    _localUserDatasource = localDatasource ?? LocalUserDatasource.to;
    _deviceStorageUserDatastore =
        deviceStorageUserDatastore ?? DeviceStorageUserDatastore.to;
  }

  @override
  Future<UserModel> getUser() async {
    return await _localUserDatasource.getUser();
  }

  @override
  Future<void> saveUser(UserModel user) async {
    await _localUserDatasource.saveUser(user);
    return Future.value();
  }

  @override
  Future<void> saveUserEmail(String email) async {
    await _localUserDatasource.saveUserEmail(email);
    return;
  }

  @override
  Future<void> saveUserImage(String imagePath) async {
    await _localUserDatasource.saveUserImage(imagePath);
    return;
  }

  @override
  Future<void> saveUserName(String name) async {
    await _localUserDatasource.saveUserName(name);
    return;
  }

  @override
  Future<void> setSetupComplete() async {
    await _localUserDatasource.setSetupComplete();
    return;
  }

  @override
  Future<String> saveProfileImage(String imagePath) async {
    final devicePath= await _deviceStorageUserDatastore.saveProfileImage(imagePath);
    await _localUserDatasource.saveUserImage(devicePath);
    return devicePath;
  }
}
