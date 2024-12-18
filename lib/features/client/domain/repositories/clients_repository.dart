
import 'package:appointments_manager/features/client/domain/entities/client_entity.dart';

abstract class ClientsRepository {
  Future<void> saveClient(ClientEntity client);
  Future<ClientEntity?> getClientById(int id);
  Future<List<ClientEntity>> getAllClients();
  Future<void> deleteClient(ClientEntity client);
}