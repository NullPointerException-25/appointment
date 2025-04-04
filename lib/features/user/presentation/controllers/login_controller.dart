import 'package:appointments_manager/features/user/domain/entities/user_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../domain/usecases/get_all_users.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find<LoginController>();


  @override
  void onInit() {
    super.onInit();
    _getUsers();
  }

  final Rx<String> email = Rx<String>("");
  final Rx<String> password = Rx<String>("");
  final RxList<UserEntity> accounts = <UserEntity>[].obs;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();


  void login()async {}

  void _getUsers() async {
    final result = await GetAllUsersUseCase().perform();
    accounts.value = result;
  }

}