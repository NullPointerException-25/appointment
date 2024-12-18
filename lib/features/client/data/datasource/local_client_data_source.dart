import 'package:appointments_manager/core/services/object_box_service.dart';
import 'package:appointments_manager/features/client/data/models/client.dart';
import 'package:get/get.dart';

class LocalClientDataSource extends GetxService{
  final _store = ObjectBoxService.to.store;

  static LocalClientDataSource get to => Get.find<LocalClientDataSource>();

  Future<int> saveClient(ClientModel client) async {
    return _store.value?.box<ClientModel>().put(client)??0;
  }
}