import 'dart:io';

import 'package:get/get.dart';

class CreateClientController extends GetxController {
  final image = Rxn<File>();
  final name = RxString("");
  final email = RxString("");
  final phone = RxString("");
  final description = RxString("");
}