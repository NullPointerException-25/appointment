import 'package:appointments_manager/features/appointment/data/repositories/appointments_repository_imp_local.dart';
import 'package:appointments_manager/features/client/data/repositories/clients_repository_impl.dart';
import 'package:appointments_manager/features/user/data/repositories/user_repository_impl.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/route_manager.dart';

class CoreServicesInitializer {

  static final CoreServicesInitializer _instance = CoreServicesInitializer._();

  CoreServicesInitializer._() {
    if(!kIsWeb){
      //Set up Repositories for mobile and desktop
      Get.put(UserDataRepositoryImpLocal());
      Get.put(ClientsRepositoryImpl());
      Get.put(AppointmentsRepositoryImpLocal());
    }
    //Set up other Repositories for web only
  }

  factory CoreServicesInitializer.init() => _instance;
}