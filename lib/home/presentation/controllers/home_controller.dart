import 'package:appointments_manager/core/utils/routes.dart';
import 'package:appointments_manager/features/user/domain/entities/user_entity.dart';
import 'package:appointments_manager/features/user/domain/usecases/get_user.dart';
import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final Rxn<UserEntity> user = Rxn<UserEntity>();
  final PageController pageController = PageController();

  final RxBool isCircularMenuOpened= RxBool(false);

  final _circularKey=GlobalKey<CircularMenuState>();

  GlobalKey<CircularMenuState> get circularMenuKey=> _circularKey;

  void changePage(int index) {
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  @override
  void onInit() {
    super.onInit();
    _getUser();
  }

  void goToCreateClientPage(){
    Get.toNamed(Routes.newClient);
  }

  void goToCreateAppointmentPage(){
     Get.toNamed(Routes.newAppointment);
  }




  static HomeController get to {
    try {
      return Get.find<HomeController>();
    } catch (e) {
      return Get.put(HomeController());
    }
  }

  void _getUser() async {
   final user=await GetUserUseCase().perform();
    this.user.value=user;
  }
}
