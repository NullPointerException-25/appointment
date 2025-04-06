import 'dart:io';
import 'package:appointments_manager/features/user/domain/usecases/setup_user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SetupController extends GetxController {
  static SetupController get to => Get.find<SetupController>();

  final Rxn<File> image = Rxn<File>();
  final Rx<String> name = Rx<String>("");
  final Rx<String> email = Rx<String>("");
  final Rx<String> password = Rx<String>("");
  final Rx<String> confirmPassword = Rx<String>("");
  final RxInt step = 0.obs;
  late PageController pageController;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  late final Map<int, bool Function()> _stepRequirements;
  final GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    _stepRequirements = {
      0: () => true,
      1: () => name.value.isNotEmpty,
      2: () => true,
      3: () => true,
    };
  }

  void nextStep() {
    if (!_stepRequirements[step.value]!()) {
      return;
    }
    if (step.value == 3) {
      _saveUserChanges();
    }
    if (step.value != 3) {
      step.value++;
      pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  void signUp() async {
    if (step.value == 3) {
      _saveUserChanges();
    }
  }

  void _saveUserChanges() {
    SetupUserUseCase(
      name: name.value,
      email: email.value,
      imagePath: image.value?.path ?? "",
    ).perform();
  }



  void previousStep() {
    pageController.previousPage(
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    step.value--;
  }

  void goToLoginStep() {
    step.value = 0;
    pageController.animateToPage(0,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  void pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      this.image.value = File(image.path);
    }
  }

  void detachImage() {
    image.value = null;
  }

  PageController initPageController() {
    pageController = PageController(initialPage: step.value);
    return pageController;
  }

  void loadPreviousData() {
    nameController.text = name.value;
    emailController.text = email.value;
  }
}
