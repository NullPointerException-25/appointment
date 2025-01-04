
import 'package:appointments_manager/features/user/data/datasource/local_user_datasource.dart';
import 'package:appointments_manager/features/user/domain/repositories/user_repository.dart';
import 'package:appointments_manager/features/user/data/models/users_model.dart';
import 'package:get/get.dart';


class UserDataRepositoryImpLocal extends GetxService implements UserRepository {
  static UserDataRepositoryImpLocal get to => Get.find<UserDataRepositoryImpLocal>();
  late final LocalUserDatasource _localUserDatasource;


  UserDataRepositoryImpLocal({LocalUserDatasource? localDatasource}){
    _localUserDatasource = localDatasource?? LocalUserDatasource.to;
  }




  @override
  Future<UserModel> getUser() async {
    return await _localUserDatasource.getUser();
  }

  @override
  Future<void> saveUser(UserModel user) async {
    _localUserDatasource.saveUser(user);
    return Future.value();
  }

  @override
  Future<void> saveUserEmail(String email) async {
    await _localUserDatasource.saveUserEmail(email);
    return;
  }

  @override
  Future<void> saveUserImage(String imagePath) async  {
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
  Future<void> saveProfileImage(String imagePath) async {
    await _localUserDatasource.saveUserImage(imagePath);
    return;
  }
}