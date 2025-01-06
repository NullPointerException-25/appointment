import 'package:appointments_manager/core/abstractions/usecases.dart';
import 'package:appointments_manager/features/client/data/repositories/clients_repository_impl.dart';
import 'package:appointments_manager/features/client/domain/entities/client_entity.dart';
import 'package:appointments_manager/features/client/domain/entities/client_query_params.dart';
import 'package:appointments_manager/features/client/domain/repositories/clients_repository.dart';
import 'package:flutter/foundation.dart';

class GetClientsByParamsUseCase extends Usecases<List<ClientEntity>> {

  late final ClientQueryParamsDto? _queryParams;
  late final LocalClientsRepositoryImpl _clientsRepositoryLocal;
  late final ClientsRepository? _clientsRepositoryRemote;
  /// This is the local repository that will be used to get the clients, if not provided it will use the default LocalClientsRepositoryImpl.
  /// Avoid injecting the repository directly at the constructor, instead use the repository instance that is already available in the class.
  /// Inject only for testing purposes
  GetClientsByParamsUseCase({
    required ClientQueryParamsDto? queryParams,
    ClientsRepository? clientsRepositoryRemote,
    LocalClientsRepositoryImpl? clientsRepositoryLocal
  }){
    _queryParams=queryParams;
    _clientsRepositoryLocal= clientsRepositoryLocal?? LocalClientsRepositoryImpl.to;
    //_clientsRepositoryRemote= clientsRepositoryRemote??RemoteClientsRepositoryImpl.to; TODO: Implement remote repository
  }

  @override
  Future<List<ClientEntity>> perform()async{
      if(!kIsWeb){
       return await _clientsRepositoryLocal.getAllClients(query: _queryParams);
      }
      return [];
  }
}