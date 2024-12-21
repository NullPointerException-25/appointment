import 'dart:io';

import 'package:get/get_rx/src/rx_types/rx_types.dart';

abstract class ControllerClientCardPreviewable {
  final RxString name ="".obs;
  final Rxn<File> image= Rxn<File>();
  final RxString description= RxString("");
  final RxString phone= "".obs;
  final RxString email= "".obs;

}