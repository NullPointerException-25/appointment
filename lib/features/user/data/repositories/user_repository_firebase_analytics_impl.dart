import 'package:appointments_manager/features/user/data/datasource/firestore_user_email_datasource.dart';
import 'package:appointments_manager/features/user/domain/repositories/user_repository_firebase_analytics.dart';
import 'package:get/get.dart';


class UserRepositoryFirebaseAnalyticsImpl extends GetxController implements UserRepositoryFirebaseAnalyticsInterface{
  static UserRepositoryFirebaseAnalyticsImpl get to => Get.find();
  late final FirestoreUserEmailsDatasource _firestoreUserEmailsDatasource;
  UserRepositoryFirebaseAnalyticsImpl({FirestoreUserEmailsDatasource? firestoreUserEmailsDatasource}){
    _firestoreUserEmailsDatasource = firestoreUserEmailsDatasource??FirestoreUserEmailsDatasource.to;
  }
  @override
  Future<void> sendEmailForNews(String email) async {
    _firestoreUserEmailsDatasource.saveEmailToReceiveNews(email);
    return;
  }
}