import 'package:appointments_manager/features/appointment/data/repositories/appointments_repository_imp_local.dart';
import 'package:appointments_manager/features/client/data/datasource/local_client_data_source.dart';
import 'package:appointments_manager/features/client/data/repositories/clients_repository_impl.dart';
import 'package:appointments_manager/features/user/data/datasource/device_storage_user_datastore.dart';
import 'package:appointments_manager/features/user/data/datasource/firestore_user_email_datasource.dart';
import 'package:appointments_manager/features/user/data/datasource/local_user_datasource.dart';
import 'package:appointments_manager/features/user/data/repositories/user_repository_firebase_analytics_impl.dart';
import 'package:appointments_manager/features/user/data/repositories/user_repository_impl_local.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/route_manager.dart';
import 'package:jiffy/jiffy.dart';

class CoreServicesInitializer {

  static final CoreServicesInitializer _instance = CoreServicesInitializer._();

  CoreServicesInitializer._() {
     Jiffy.setLocale(Get.deviceLocale?.languageCode??"en");
    if(!kIsWeb){
      //Set up Repositories for mobile and desktop

      //User
          //Datasources
          Get.put(LocalUserDatasource());
          Get.put(DeviceStorageUserDatastore());
          Get.put(FirestoreUserEmailsDatasource());
          //Repositories
          Get.put(UserRepositoryFirebaseAnalyticsImpl());
          Get.put(UserRepositoryImpLocal());
      //Clients
          //Datasources
          Get.put(LocalClientDataSource());
          //Repositories
          Get.put(LocalClientsRepositoryImpl());
      //Appointments
          //Repositories
          Get.put(AppointmentsRepositoryImpLocal());
    }

    //Set up other Repositories for web only

  }

  factory CoreServicesInitializer.init() => _instance;
}