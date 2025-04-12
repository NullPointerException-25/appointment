
import 'package:appointments_manager/features/user/data/models/users_model.dart';
import 'package:get/get.dart';

import '../../domain/repositories/user_repository_firebase.dart';
import '../datasource/user_remote_firestore_datasource.dart';


class UserRepositoryFirebaseImpl extends GetxService implements UserRepositoryFirebase{
  static UserRepositoryFirebaseImpl get to => Get.find();
  late final UserRemoteFirestoreDatasource _firestoreUserFirestoreDatasource;
  UserRepositoryFirebaseImpl({UserRemoteFirestoreDatasource? firestoreUserEmailsDatasource}){
    _firestoreUserFirestoreDatasource = firestoreUserEmailsDatasource??UserRemoteFirestoreDatasource.to;
  }
  @override
  @Deprecated("Do not save email for news")
  Future<void> sendEmailForNews(String email) async {
    _firestoreUserFirestoreDatasource.saveEmailToReceiveNews(email);
    return;
  }

  @override
  Future<UserModel> getUser(String remoteId) {
    return _firestoreUserFirestoreDatasource.getUser(remoteId);
  }

  @override
  Future<UserModel> saveUser(UserModel user) {
    return _firestoreUserFirestoreDatasource.saveUser(user);
  }
}