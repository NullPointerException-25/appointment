import 'package:appointments_manager/core/abstractions/usecases.dart';
import 'package:appointments_manager/features/user/data/repositories/user_repository_impl_local.dart';

class SetSetupCompletedUseCase extends UseCase{
  late final UserRepositoryImpLocal _repository;

  SetSetupCompletedUseCase({UserRepositoryImpLocal? repository}){
    _repository = repository??UserRepositoryImpLocal.to;
  }
  @override
  Future<void> perform() async {
    _repository.setSetupComplete();
  }
}