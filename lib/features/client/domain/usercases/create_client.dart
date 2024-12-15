import 'package:appointments_manager/features/client/domain/entities/client_entity.dart';
import 'package:appointments_manager/features/client/domain/repositories/clients_repository.dart';

class CreateClientUseCase {
  final ClientsRepository _clientRepository;

  CreateClientUseCase(this._clientRepository);

  Future<void> execute(ClientEntity client) async {
    return _clientRepository.saveClient(client);
  }
}