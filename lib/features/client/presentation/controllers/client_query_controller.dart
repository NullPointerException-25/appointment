import 'package:appointments_manager/core/utils/routes.dart';
import 'package:appointments_manager/features/client/data/models/client.dart';
import 'package:appointments_manager/features/client/domain/entities/client_entity.dart';
import 'package:appointments_manager/features/client/domain/entities/client_query_params.dart';
import 'package:appointments_manager/features/client/domain/usecases/get_clients_by_params.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class ClientQueryController extends GetxController {
  static ClientQueryController get to => Get.find<ClientQueryController>();
  final RxList<ClientEntity> clients = RxList<ClientEntity>();
  final Rx<ClientQueryParamsDto> _params =
      Rx<ClientQueryParamsDto>(ClientQueryParamsDto());
  final RxnString name = RxnString(null);
  final RxBool descending = RxBool(false);
  final RxBool orderByDate = RxBool(false);
  int _limit = 10;
  int _offset = 0;

  @override
  void onInit() {
    super.onInit();
    _getClientsByParams();
  }

  void _getClientsByParams() async {
    clients.addAll(
        await GetClientsByParamsUseCase(queryParams: _params.value).perform());
  }

  void goToClientDetailsPage(ClientEntity client) {
    Get.toNamed(Routes.client,
        parameters: {
          if (!kIsWeb) "localId": client.localId.toString(),
          if (client.remoteId.isNotEmpty) "remoteId": client.remoteId
        },
        arguments: client);
  }

  void goToCreateAppointment(ClientEntity client) {
    Get.toNamed(Routes.newAppointment,
        parameters: {
          if (!kIsWeb) "clientLocalId": client.localId.toString(),
          if (client.remoteId.isNotEmpty)
            "clientRemoteId": client.remoteId.toString()
        },
        arguments: client);
  }

  void searchClients() {
    clients.clear();
    _limit = 10;
    _offset = 0;
    _params.value = ClientQueryParamsDto(
        limit: _limit,
        offset: _offset,
        descending: descending.value,
        orderByDate: orderByDate.value,
        filterByName: name.value);
    _getClientsByParams();
  }

  void fetchMoreClients() {
    _params.value = _params.value.copyWith(offset: clients.length + 1);
    _getClientsByParams();
  }
}
