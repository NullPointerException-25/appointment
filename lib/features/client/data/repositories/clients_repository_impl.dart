import 'package:appointments_manager/features/client/data/datasource/local_client_data_source.dart';
import 'package:appointments_manager/features/client/domain/entities/client_entity.dart';
import 'package:appointments_manager/features/client/domain/entities/client_query_params.dart';
import 'package:appointments_manager/features/client/domain/repositories/clients_repository.dart';
import 'package:get/get.dart';

class LocalClientsRepositoryImpl extends GetxService implements ClientsRepository{
  static LocalClientsRepositoryImpl get to => Get.find<LocalClientsRepositoryImpl>();
  late final LocalClientDataSource _localClientDataSource;

  LocalClientsRepositoryImpl._(){
   _localClientDataSource=  Get.put<LocalClientDataSource>(LocalClientDataSource());
  }

  static LocalClientsRepositoryImpl init(){
      return LocalClientsRepositoryImpl._();
  }
  @override
  Future<void> deleteClient(ClientEntity client) async {
    //Throw unimplemented error
    throw UnimplementedError();
  }

  @override
  Future<List<ClientEntity>> getAllClients({ClientQueryParamsDto? query}) async {
    final clients=  await _localClientDataSource.getClients(query: query);
    return clients.map((e) => e.toEntity()).toList();
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