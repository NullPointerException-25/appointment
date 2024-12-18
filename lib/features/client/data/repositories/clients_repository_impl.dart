import 'package:appointments_manager/features/client/data/datasource/local_client_data_source.dart';
import 'package:appointments_manager/features/client/domain/entities/client_entity.dart';
import 'package:appointments_manager/features/client/domain/repositories/clients_repository.dart';
import 'package:get/get.dart';

class ClientsRepositoryImpl extends GetxService implements ClientsRepository{
  static ClientsRepositoryImpl get to => Get.find<ClientsRepositoryImpl>();
  late final LocalClientDataSource _localClientDataSource;

  ClientsRepositoryImpl(){
   _localClientDataSource=  Get.put<LocalClientDataSource>(LocalClientDataSource());
  }
  @override
  Future<void> deleteClient(ClientEntity client) async {
    //Throw unimplemented error
    throw UnimplementedError();
  }

  @override
  Future<List<ClientEntity>> getAllClients() async {
    throw UnimplementedError();
  }

  @override
  Future<ClientEntity?> getClientById(int id) async {
    throw UnimplementedError();
  }


  @override
  Future<void> saveClient(ClientEntity client) async {
    final clientModel = client.toModel();
    await _localClientDataSource.saveClient(clientModel);
    return;
  }
}