import 'dart:io';
import 'package:appointments_manager/features/user/domain/usecases/setup_user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SetupController extends GetxController {
  static SetupController get to {
    try {
      return Get.find<SetupController>();
    } catch (e) {
      return Get.put(SetupController());
    }
  }

  final Rxn<File> image = Rxn<File>();
  final Rx<String> name = Rx<String>("");
  final Rx<String> email = Rx<String>("");
  final RxInt step = 0.obs;
  late PageController pageController;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  late final Map<int, bool Function()> _stepRequirements;
  final GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    _stepRequirements = {
      0: () => name.value.isNotEmpty,
      1: () => true,
      2: () => true,
    };
  }

  void nextStep() {
    try {
      if (!_stepRequirements[step.value]!()) {
        return;
      }
      if (step.value == 2) {
        _saveUserChanges();
      }
      step.value++;
      pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    } catch (e) {
      step.value = 0;
      pageController.animateToPage(0,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  void _saveUserChanges() async {
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
