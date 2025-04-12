import 'package:firebase_auth/firebase_auth.dart';

abstract class UserAuthRepository {
  Future<UserCredential?> signInWithEmailAndPassword(String email, String password);
  Future<void> signUpWithEmailAndPassword(String email, String password);
  Future<void> signOut();
  Future<void> resetPassword(String email);
  Future<String?> getCurrentUserId();
}