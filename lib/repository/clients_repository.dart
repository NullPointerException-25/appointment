import 'package:appointments_manager/schema/client.dart';

abstract class ClientsRepository<T> {
  Future<void> saveClient(ClientSchema client);
  Future<ClientSchema> getClientById(int id);
  Future<List<ClientSchema>> getAllClients();
  Future<void> deleteClient(ClientSchema client);
  Future<void> setSetupComplete();
  Future<List<ClientSchema>> getClientsByQuery(T query);
}