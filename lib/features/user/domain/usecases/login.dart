import 'package:appointments_manager/core/abstractions/usecases.dart';
import 'package:appointments_manager/features/user/data/repositories/user_auth_repository_impl.dart';
import 'package:appointments_manager/features/user/data/repositories/user_repository_impl_local.dart';
import 'package:appointments_manager/features/user/domain/entities/user_entity.dart';
import 'package:get/get.dart';

import '../../../../core/utils/routes.dart';

class LoginUseCase extends UseCase<void> {
  late final UserRepositoryImpLocal _repositoryImpLocal;
  late final UserAuthRepositoryImpl _authRepositoryImpl;

  LoginUseCase({
    UserRepositoryImpLocal? repositoryImpLocal,
    UserAuthRepositoryImpl? authRepositoryImpl,
  }) {
    _repositoryImpLocal = repositoryImpLocal ?? UserRepositoryImpLocal.to;
    _authRepositoryImpl = authRepositoryImpl ?? UserAuthRepositoryImpl.to;
  }

  @override
  Future<void> perform({UserEntity? user}) async {
    if(user == null) {
      throw Exception("User is null");
    }
    if(user.remoteId.isNotEmpty){
      await _authRepositoryImpl.requestAuth(user.toModel());
    }
    await _repositoryImpLocal.changeUser(user.localId);

    Get.offAllNamed(Routes.home);
  }
}