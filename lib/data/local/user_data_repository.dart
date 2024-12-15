import 'package:appointments_manager/repository/user_repository.dart';
import 'package:appointments_manager/schema/users.dart';
import 'package:appointments_manager/services/profile_service.dart';
import 'package:appointments_manager/utils/routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../objectbox.g.dart';

class UserDataRepositoryImpLocal extends GetxService implements UserRepository {
  static UserDataRepositoryImpLocal get to => Get.find<UserDataRepositoryImpLocal>();
  final Rx<UserSchema> _user = ProfileService.to.user;
  final Rx<Store> _store = ProfileService.to.store;
  final _firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
    checkUserSetup(_user.value);
    ever(_user, checkUserSetup);
  }

 @override
  String checkUserSetup(UserSchema user) {
    if(!user.isSetupComplete){
      Get.offAllNamed(Routes.setup);
      return (Routes.setup);
    }
    Get.offAllNamed(Routes.home);
    return (Routes.home);
  }

  @override
  Future<UserSchema> getUser() async {
    return _user.value;
  }

  @override
  Future<void> saveUser(UserSchema user) {
    _user.value.email = user.email;
    _user.value.imagePath = user.imagePath;
    _user.value.name = user.name;
    _store.value.box<UserSchema>().put(_user.value);
    return Future.value();
  }

  @override
  Future<void> saveUserEmail(String email) {
    _user.value.email = email;
    _store.value.box<UserSchema>().put(_user.value);
    _firestore.collection('emails').add({'email': email});
    return Future.value();
  }

  @override
  Future<void> saveUserImage(String imagePath) {
    _user.value.imagePath = imagePath;
    _store.value.box<UserSchema>().put(_user.value);
    return Future.value();
  }

  @override
  Future<void> saveUserName(String name) {
    _user.value.name = name;
    _store.value.box<UserSchema>().put(_user.value);
    return Future.value();
  }

  @override
  Future<void> setSetupComplete() {
    _user.value.isSetupComplete = true;
    _store.value.box<UserSchema>().put(_user.value);
    _user.value= _store.value.box<UserSchema>().get(_user.value.id)!;
    return Future.value();
  }
}