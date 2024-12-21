import 'package:appointments_manager/features/client/data/repositories/clients_repository_impl.dart';
import 'package:appointments_manager/features/client/domain/entities/client_entity.dart';
import 'package:appointments_manager/features/client/domain/repositories/clients_repository.dart';

class CreateClientUseCase {
  late final ClientsRepository _localClientRepository;

  CreateClientUseCase(){
    _localClientRepository = LocalClientsRepositoryImpl.to;
  }

  Future<void> execute(ClientEntity client) async {
    return _localClientRepository.saveClient(client);
  }
}