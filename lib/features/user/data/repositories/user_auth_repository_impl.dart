import 'package:appointments_manager/core/services/in_app_notification_service.dart';
import 'package:appointments_manager/core/utils/translations.dart';
import 'package:appointments_manager/features/user/data/models/users_model.dart';
import 'package:appointments_manager/features/user/domain/repositories/user_auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
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
  Future<UserCredential?> signInWithEmailAndPassword(String email, String password) async {
    try {
      return await _firebaseAuthDatasource.signInWithEmailAndPassword(email, password);
    } on FirebaseAuthException catch (error, _) {
      debugPrint(error.toString());
      InAppNotificationService.to
          .showNotificationError(Translator.incorrectCredential.tr);
      return null;
    }
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
    final result = await Get.dialog<String?>(AuthDialog(
      user: user.toEntity(),
    ));
    if (result == null || result.isEmpty) {
      return false;
    }
    return await signInWithEmailAndPassword(user.email.trim().toLowerCase(), result)!=null;
  }
}
