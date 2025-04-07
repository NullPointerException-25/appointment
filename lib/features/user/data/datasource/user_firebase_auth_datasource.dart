import 'package:appointments_manager/core/utils/routes.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserFirebaseAuthDatasource extends GetxService {
  static UserFirebaseAuthDatasource get to => Get.find<UserFirebaseAuthDatasource>();
  late final FirebaseAuth _firebaseAuth;
  final Rxn<User> _user = Rxn<User>();

  UserFirebaseAuthDatasource({FirebaseAuth? firebaseAuth}) {
    _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;
  }


  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_firebaseAuth.userChanges());
  }

  Future<UserCredential> signInWithEmailAndPassword(String email, String password) async {
    return await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<UserCredential> createUserWithEmailAndPassword(String email, String password) async {
     return await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<void> sendPasswordResetEmail(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<String?> getCurrentUserId() async {
    return _firebaseAuth.currentUser?.uid;
  }
}