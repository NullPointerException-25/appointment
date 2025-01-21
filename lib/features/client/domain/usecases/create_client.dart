import 'package:appointments_manager/core/utils/routes.dart';
import 'package:appointments_manager/features/client/data/repositories/clients_repository_impl.dart';
import 'package:appointments_manager/features/client/domain/entities/client_entity.dart';
import 'package:appointments_manager/features/client/domain/repositories/clients_repository.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class CreateClientUseCase {
  late final ClientsRepository _localClientRepository;

  CreateClientUseCase(){
    _localClientRepository = LocalClientsRepositoryImpl.to;
  }

  Future<void> execute(ClientEntity client) async {
    Get.offAllNamed(Routes.home);
    return _localClientRepository.saveClient(client);
  }
}