import 'package:appointments_manager/features/client/presentation/controllers/client_query_controller.dart';
import 'package:get/get.dart';

class QueryClientsBinding extends Bindings{
  @override
  void dependencies() {
     Get.put(ClientQueryController());
  }
}