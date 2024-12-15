import 'package:appointments_manager/data/local/appointments_repository_imp_local.dart';
import 'package:appointments_manager/data/local/clients_repository_imp_local.dart';
import 'package:appointments_manager/data/local/user_data_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {



  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      if(!kIsWeb){
        //Set up Repositories for mobile and desktop
        Get.put(UserDataRepositoryImpLocal());
        Get.put(ClientsRepositoryImpLocal());
        Get.put(AppointmentsRepositoryImpLocal());
      }
      //Set up other Repositories for web only


    });
  }
}
