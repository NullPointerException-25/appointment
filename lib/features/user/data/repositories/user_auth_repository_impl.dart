import 'package:appointments_manager/features/user/data/models/users_model.dart';
import 'package:appointments_manager/features/user/domain/repositories/user_auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../presentation/widgets/auth_dialog.dart';
import '../datasource/user_firebase_auth_datasource.dart';

class UserAuthRepositoryImpl extends GetxService implements UserAuthRepository {
  late final UserFirebaseAuthDatasource _firebaseAuthDatasource;

  static UserAuthRepositoryImpl get to => Get.find<UserAuthRepositoryImpl>();

  UserAuthRepositoryImpl({UserFirebaseAuthDatasource? firebaseAuthDatasource}) {
    _firebaseAuthDatasource =
        firebaseAuthDatasource ?? UserFirebaseAuthDatasource.to;
  }

  @override
  Future<void> resetPassword(String email) {
    return _firebaseAuthDatasource.sendPasswordResetEmail(email);
  }

  @override
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    await _firebaseAuthDatasource.signInWithEmailAndPassword(email, password);
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuthDatasource.signOut();
  }

  @override
  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    await _firebaseAuthDatasource.createUserWithEmailAndPassword(
        email, password);
  }

  @override
  Future<String?> getCurrentUserId() {
    return _firebaseAuthDatasource.getCurrentUserId();
  }

  Future<bool> requestAuth(UserModel user) async {
    try {
      final result= await Get.dialog<String?>(AuthDialog(email: user.email));

      if (result == null || result.isEmpty) {
        return false;
      }

      return false;
    } catch (e) {
      return false;
    }
  }
}
