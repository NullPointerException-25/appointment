import 'package:appointments_manager/core/abstractions/usecases.dart';
import 'package:appointments_manager/core/services/in_app_notification_service.dart';
import 'package:appointments_manager/core/utils/routes.dart';
import 'package:appointments_manager/core/utils/translations.dart';
import 'package:appointments_manager/features/client/data/repositories/clients_repository_impl.dart';
import 'package:appointments_manager/features/client/domain/entities/client_entity.dart';
import 'package:get/get.dart';

class GetClientByUrlParamsUseCase extends UseCase {
  late final Map<String, String?> _params;
  late final LocalClientsRepositoryImpl _localRepository;

  GetClientByUrlParamsUseCase({required Map<String, String?> params, LocalClientsRepositoryImpl? repository}){
    _params = params;
    _localRepository = repository??LocalClientsRepositoryImpl.to;
  }
  @override
  Future<ClientEntity> perform() async{
    if(_params.containsKey("localId")){
      final result = await _localRepository.getClientById(int.parse(_params["localId"]!));
      if(result==null){
        InAppNotificationService.to.showNotificationError(Translator.somethingWentWrong.tr);
        Get.offNamed(Routes.home);
        throw Exception("Client not found");
      }

      return result;
    }
    throw UnimplementedError();
  }
}