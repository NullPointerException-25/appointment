import 'package:appointments_manager/core/utils/colors.dart';
import 'package:appointments_manager/core/utils/global_values.dart';
import 'package:appointments_manager/core/utils/routes.dart';
import 'package:appointments_manager/features/user/domain/entities/user_entity.dart';
import 'package:appointments_manager/features/user/domain/usecases/get_user.dart';
import 'package:appointments_manager/features/user/domain/usecases/logout.dart';
import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final Rxn<UserEntity> user = Rxn<UserEntity>();
  final PageController pageController = PageController();
  final RxnDouble bottomAppBarHeight = RxnDouble();
  final RxBool isCircularMenuOpened = RxBool(false);
  final _circularKey = GlobalKey<CircularMenuState>();
  final selectedIndex = RxnInt(0);

  GlobalKey<CircularMenuState> get circularMenuKey => _circularKey;

  void changePage(int index) {
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  @override
  void onInit() {
    super.onInit();
    _getUser();
  }

  void goToCreateClientPage() {
    Get.toNamed(Routes.newClient);
  }

  void goToCreateAppointmentPage() {
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
    final user = await GetUserUseCase().perform();
    this.user.value = user;
  }

  void openAvatarMenu(BuildContext context, TapDownDetails details) async {
    final result = await showMenu(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kCornerRadius),
      ),
      color: ThemeColors.darkBlue,
      context: context,
      position: RelativeRect.fromLTRB(
        details.globalPosition.dx,
        details.globalPosition.dy + 36,
        details.globalPosition.dx + 1,
        details.globalPosition.dy + 1,
      ),
      items: [
        PopupMenuItem(
            value: '1',
            child: Text(
              'Ver perfil',
              style: Theme.of(context).textTheme.displaySmall,
            )),
        PopupMenuItem(
            value: '2',
            child: Text(
              'Configuración',
              style: Theme.of(context).textTheme.displaySmall,
            )),
        PopupMenuItem(
            value: '3',
            child: Text('Cerrar sesión',
                style: Theme.of(context).textTheme.displaySmall)),
      ],
    );

    if(result=="3"){
      LogoutUseCase().perform();
    }
  }
}
