abstract class UserAuthRepository {
  Future<bool> signInWithEmailAndPassword(String email, String password);
  Future<void> signUpWithEmailAndPassword(String email, String password);
  Future<void> signOut();
  Future<void> resetPassword(String email);
  Future<String?> getCurrentUserId();
}