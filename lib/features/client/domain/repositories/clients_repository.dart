
import 'package:appointments_manager/features/client/domain/entities/client_entity.dart';
import 'package:appointments_manager/features/client/domain/entities/client_query_params.dart';

abstract class ClientsRepository {
  Future<void> saveClient(ClientEntity client);
  Future<ClientEntity?> getClientById(int id);
  Future<List<ClientEntity>> getAllClients({ClientQueryParamsDto? query});
  Future<void> deleteClient(ClientEntity client);
}