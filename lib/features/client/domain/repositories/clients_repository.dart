import 'package:appointments_manager/features/client/data/models/client.dart';

abstract class ClientsRepository<T> {
  Future<void> saveClient(ClientSchema client);
  Future<ClientSchema?> getClientById(int id);
  Future<List<ClientSchema>> getAllClients();
  Future<void> deleteClient(ClientSchema client);
  Future<List<ClientSchema>> getClientsByQuery(T query);
}