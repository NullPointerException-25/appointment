import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get to {
    try {
      return Get.find<LoginController>();
    } catch (e) {
      return Get.put(LoginController());
    }
  }
  final Rx<String> email = Rx<String>("");
  final Rx<String> password = Rx<String>("");

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();


  void login()async {}

}