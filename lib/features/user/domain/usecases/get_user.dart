import 'package:appointments_manager/core/abstractions/usecases.dart';
import 'package:appointments_manager/features/user/data/repositories/user_repository_impl_local.dart';
import 'package:appointments_manager/features/user/domain/entities/user_entity.dart';

class GetUserUseCase extends UseCase{
  late final UserRepositoryImpLocal _localRepository;

  GetUserUseCase({UserRepositoryImpLocal? repository}){
    _localRepository = repository??UserRepositoryImpLocal.to;
  }
  @override
  Future<UserEntity> perform() async  {
    final result=  await _localRepository.getUser();
    return UserEntity.fromModel(result);
  }
}