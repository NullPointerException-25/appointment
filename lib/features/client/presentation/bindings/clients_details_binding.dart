import 'package:appointments_manager/features/client/presentation/controllers/client_details_controller.dart';
import 'package:get/get.dart';


class ClientsDetailsBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(ClientDetailsController());
  }
}