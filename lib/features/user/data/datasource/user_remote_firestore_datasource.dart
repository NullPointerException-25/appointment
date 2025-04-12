import 'package:appointments_manager/features/user/data/models/users_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class UserRemoteFirestoreDatasource extends GetxService {
  static UserRemoteFirestoreDatasource get to => Get.find<UserRemoteFirestoreDatasource>();
  late final FirebaseFirestore _firestore;
  final String _collectionName = 'users';
  final String _collectionNameEmails = 'emails';

  UserRemoteFirestoreDatasource({FirebaseFirestore? firestore}){
    _firestore = firestore?? FirebaseFirestore.instance;
  }
  @Deprecated("Do not save email for news")
  Future<void> saveEmailToReceiveNews(String email) async {
    await _firestore.collection(_collectionNameEmails).add({'email': email});
  }

  Future<UserModel> saveUser(UserModel user) async {
    await _firestore.collection(_collectionName).doc(user.remoteId).set(user.toJson());
    final doc = await  _firestore.collection(_collectionName).doc(user.remoteId).get();
    return UserModel.fromJson(doc.data()!)..id=user.id;
  }

  Future<UserModel> getUser(String remoteId) async {
    final doc = await _firestore.collection(_collectionName).doc(remoteId).get();
    return UserModel.fromJson(doc.data()!)..id=0;
  }
}
