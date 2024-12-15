import 'package:appointments_manager/features/client/presentation/controllers/create_client_controller.dart';
import 'package:get/instance_manager.dart';

class CreateClientBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CreateClientController());
  }
}