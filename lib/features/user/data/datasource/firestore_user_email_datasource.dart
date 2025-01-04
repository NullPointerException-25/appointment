import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class FirestoreUserEmailsDatasource extends GetxService {
  static FirestoreUserEmailsDatasource get to => Get.find<FirestoreUserEmailsDatasource>();
  late final FirebaseFirestore _firestore;

  FirestoreUserEmailsDatasource({FirebaseFirestore? firestore}){
    _firestore = firestore?? FirebaseFirestore.instance;
  }

  Future<void> saveEmailToReceiveNews(String email) async {
    await _firestore.collection('emails').add({'email': email});
  }
}
