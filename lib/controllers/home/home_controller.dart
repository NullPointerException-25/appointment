import 'package:appointments_manager/schema/users.dart';
import 'package:appointments_manager/services/profile_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final Rxn<UserSchema> user = Rxn<UserSchema>();
  final PageController pageController = PageController();

  void changePage(int index) {
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  @override
  void onInit() {
    super.onInit();
    _getUser();
  }

  static HomeController get to {
    try {
      return Get.find<HomeController>();
    } catch (e) {
      return Get.put(HomeController());
    }
  }

  void _getUser() async {
    user.value = ProfileService.to.user.value;
  }
}
