import 'package:appointments_manager/features/client/presentation/controllers/client_details_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class ClientsDetailsBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(ClientDetailsController());
  }
}