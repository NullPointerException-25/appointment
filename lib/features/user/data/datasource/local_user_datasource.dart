import 'package:appointments_manager/core/services/profile_service.dart';
import 'package:appointments_manager/core/utils/routes.dart';
import 'package:appointments_manager/features/user/data/models/users_model.dart';
import 'package:appointments_manager/objectbox.g.dart';
import 'package:get/get.dart';

class LocalUserDatasource extends GetxService {
  static LocalUserDatasource get to => Get.find<LocalUserDatasource>();
  late final Rx<UserModel> _user;
  late final Rx<Store> _store;
  late final ProfileService _profileService;

  LocalUserDatasource({ProfileService? profileService}){
    _profileService = profileService ?? ProfileService.to;
    _user = _profileService.user;
    _store = _profileService.store;
  }


  @override
  void onInit() {
    super.onInit();
    checkUserSetup(_user.value);
    ever(_user, checkUserSetup);
  }


  void checkUserSetup(UserModel user) {
    if(!user.isSetupComplete){
      Get.offAllNamed(Routes.setup);
    }
    Get.offAllNamed(Routes.home);
  }

  Future<UserModel> getUser() async {
    return _user.value;
  }


  Future<void> saveUser(UserModel user) {
    _user.value.email = user.email;
    _user.value.imagePath = user.imagePath;
    _user.value.name = user.name;
    _store.value.box<UserModel>().put(_user.value);
    return Future.value();
  }


  Future<void> saveUserEmail(String email) {
    _user.value.email = email;
    _store.value.box<UserModel>().put(_user.value);
    return Future.value();
  }


  Future<void> saveUserImage(String imagePath) {
    _user.value.imagePath = imagePath;
    _store.value.box<UserModel>().put(_user.value);
    return Future.value();
  }


  Future<void> saveUserName(String name) {
    _user.value.name = name;
    _store.value.box<UserModel>().put(_user.value);
    return Future.value();
  }


  Future<void> setSetupComplete() {
    _user.value.isSetupComplete = true;
    _store.value.box<UserModel>().put(_user.value);
    _user.value= _store.value.box<UserModel>().get(_user.value.id)!;
    return Future.value();
  }

  Future<List<UserModel>> getUsers() {
    final users = _store.value.box<UserModel>().getAll();
    return Future.value(users);
  }

  Future<UserModel> createUser(UserModel user) async {
    final id = _store.value.box<UserModel>().put(user);
    user.id = id;
    _profileService.changeProfile(id);
    return user;
  }

  Future<void> changeUser(int id) async {
    _profileService.changeProfile(id);
    return;
  }
}