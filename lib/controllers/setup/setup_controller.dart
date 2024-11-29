import 'dart:io';

import 'package:appointments_manager/data/user_data_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SetupController extends GetxController{

  static SetupController get to  {
  try{
   return Get.find<SetupController>();
  }
  catch(e){
   return Get.put(SetupController());
  }
}


  final Rxn<File> image = Rxn<File>();
  final Rx<String> name = Rx<String>("");
  final Rx<String> email = Rx<String>("");
  final RxInt step = 0.obs;
  final PageController pageController = PageController(keepPage: true);
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
  void nextStep(){

    if(!_stepRequirements[step.value]!()){
      return;
    }
    if(step.value == 2){
      _saveUserChanges();
    }
    step.value++;
    pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  void _saveUserChanges(){
    UserDataRepository.to.saveUserName(name.value);
    UserDataRepository.to.saveUserEmail(email.value);
    if(image.value != null) {
      UserDataRepository.to.saveUserImage(image.value!.path);
    }
    UserDataRepository.to.setSetupComplete();
  }

  void previousStep(){
    pageController.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    step.value--;
  }

  void pickImage()async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image != null){
      this.image.value = File(image.path);
    }
  }

  void detachImage(){
    image.value = null;
  }
}

