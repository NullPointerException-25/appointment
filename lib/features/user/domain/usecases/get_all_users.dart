import 'package:appointments_manager/core/abstractions/usecases.dart';
import 'package:appointments_manager/features/user/domain/entities/user_entity.dart';

import '../../data/repositories/user_repository_impl_local.dart';

class GetAllUsersUseCase extends UseCase<List<UserEntity>> {
  late final UserRepositoryImpLocal _localRepository;

  GetAllUsersUseCase({UserRepositoryImpLocal? repository}) {
    _localRepository = repository ?? UserRepositoryImpLocal.to;
  }

  @override
  Future<List<UserEntity>> perform() async{
     final result = await _localRepository.getUsers();
     return result.map((user) => UserEntity.fromModel(user)).toList();
  }
}