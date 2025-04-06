import 'package:appointments_manager/features/user/data/models/users_model.dart';

abstract class UserRepositoryFirebase {
  Future<void> sendEmailForNews(String email);
  Future<UserModel> saveUser(UserModel user);
  Future<UserModel> getUser(String remoteId);
}