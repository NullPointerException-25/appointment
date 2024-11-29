
import 'package:appointments_manager/schema/users.dart';

abstract class UserRepository {
  Future<void> saveUserName(String name);
  Future<void> saveUserEmail(String email);
  Future<void> saveUserImage(String imagePath);
  Future<void> saveUser(UserSchema user);
  Future<UserSchema> getUser();
   checkUserSetup(UserSchema user);
  Future<void> setSetupComplete();
}