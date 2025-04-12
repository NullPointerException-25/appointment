
import 'package:appointments_manager/features/user/data/models/users_model.dart';

abstract class UserRepository {

  Future<void> saveUserName(String name);
  Future<void> saveUserEmail(String email);
  Future<void> saveUserImage(String imagePath);
  Future<void> saveUser(UserModel user);
  Future<UserModel> getUser();
  Future<void> setSetupComplete();
  Future<String> saveProfileImage(String imagePath);
  Future<List<UserModel>> getUsers();
  Future<UserModel> createUser(UserModel user);
  Future<void> changeUser(int id);
}