import 'package:appointments_manager/features/client/data/repositories/clients_repository_impl.dart';
import 'package:appointments_manager/features/client/domain/entities/client_entity.dart';
import 'package:appointments_manager/features/client/domain/entities/client_query_params.dart';
import 'package:appointments_manager/features/client/domain/repositories/clients_repository.dart';
import 'package:flutter/foundation.dart';

class GetClientsByParamsUseCase {

  late final ClientQueryParamsDto? _queryParams;
  late final ClientsRepository _clientsRepositoryLocal;

  GetClientsByParamsUseCase({
    required ClientQueryParamsDto? queryParams,
  }){
    _queryParams=queryParams;
    _clientsRepositoryLocal= LocalClientsRepositoryImpl.to;
  }

  Future<List<ClientEntity>> perform()async{
      if(!kIsWeb){
       return await _clientsRepositoryLocal.getAllClients(query: _queryParams);
      }
      return [];
  }
}