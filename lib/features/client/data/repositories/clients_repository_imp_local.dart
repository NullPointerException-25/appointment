import 'package:appointments_manager/core/services/object_box_service.dart';
import 'package:appointments_manager/objectbox.g.dart';
import 'package:appointments_manager/features/client/domain/repositories/clients_repository.dart';
import 'package:appointments_manager/features/client/data/models/client.dart';
import 'package:get/get.dart';
import 'package:objectbox/objectbox.dart';

class ClientsRepositoryImpLocal extends GetxService implements ClientsRepository<QueryBuilder<ClientSchema>>{
  static ClientsRepositoryImpLocal get to => Get.find<ClientsRepositoryImpLocal>();
  final _store = ObjectBoxService.to.store;

  @override
  Future<void> deleteClient(ClientSchema client) async {
    _store.value?.box<ClientSchema>().remove(client.id);
    return;
  }

  @override
  Future<List<ClientSchema>> getAllClients() async {
    return  _store.value?.box<ClientSchema>().getAll() ?? [];
  }

  @override
  Future<ClientSchema?> getClientById(int id) async {
    return  _store.value?.box<ClientSchema>().get(id);
  }

  @override
  Future<List<ClientSchema>> getClientsByQuery(QueryBuilder<ClientSchema> query) async {
    return await query.build().findAsync();
  }

  @override
  Future<void> saveClient(ClientSchema client) async {
    _store.value?.box<ClientSchema>().put(client);
    return;
  }
}