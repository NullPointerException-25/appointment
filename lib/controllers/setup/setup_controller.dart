import 'dart:io';

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
  final Rxn<String> name = Rxn<String>();
  final Rxn<String> email = Rxn<String>();
  final RxInt step = 0.obs;
  final RxnBool receiveNotifications = RxnBool();
  final PageController pageController = PageController();
  late final Map<int, bool Function()> _stepRequirements;


  @override
  void onInit() {
    super.onInit();
    _stepRequirements = {
      0: () => name.value != null && name.value!.isNotEmpty,
      1: () => true,
      2: () => receiveNotifications.value != null,
    };
  }
  void nextStep(){
    if(!_stepRequirements[step.value]!()){
      return;
    }
    step.value++;
    pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
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

