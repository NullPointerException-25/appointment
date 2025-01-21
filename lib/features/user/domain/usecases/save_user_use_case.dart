import 'package:appointments_manager/core/abstractions/usecases.dart';
import 'package:appointments_manager/features/user/data/repositories/user_repository_impl_local.dart';
import 'package:appointments_manager/features/user/domain/entities/user_entity.dart';
import 'package:appointments_manager/features/user/domain/repositories/user_repository.dart';

class SaveUserUseCase extends UseCase {
  late UserEntity user;
  late final List<UserRepository> _repositories;

  SaveUserUseCase(this.user,
      {
      List<UserRepository>? repositories}) {
    _repositories = repositories ??
        [
          UserRepositoryImpLocal.to,
        ];
  }

  @override
  Future<void> perform() async {
    for (final repository in _repositories) {
      repository.saveUser(user.toModel());
    }
    return;
  }
}
