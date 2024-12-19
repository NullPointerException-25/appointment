import 'package:appointments_manager/features/client/domain/entities/client_entity.dart';
import 'package:appointments_manager/features/client/domain/entities/client_query_params.dart';
import 'package:appointments_manager/features/client/domain/usecases/get_clients_by_params.dart';
import 'package:get/get.dart';

class ClientQueryController extends GetxController{
  static ClientQueryController get to => Get.find<ClientQueryController>();
  final RxList<ClientEntity> clients= RxList<ClientEntity>();
  final Rx<ClientQueryParamsDto> params= Rx(ClientQueryParamsDto());


  @override
  void onInit() {
    super.onInit();
    getClientsByParams();
  }

  void getClientsByParams() async{
    clients.addAll(await GetClientsByParamsUseCase(queryParams: params.value).perform());
  }
}