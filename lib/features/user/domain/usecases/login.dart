import 'package:appointments_manager/core/abstractions/usecases.dart';
import 'package:appointments_manager/features/user/data/repositories/user_auth_repository_impl.dart';
import 'package:appointments_manager/features/user/data/repositories/user_repository_impl_local.dart';
import 'package:appointments_manager/features/user/domain/entities/user_entity.dart';
import 'package:appointments_manager/features/user/domain/usecases/remote_login_use_case.dart';
import 'package:get/get.dart';

import '../../../../core/utils/routes.dart';
import '../../data/repositories/user_repository_firebase_impl.dart';

class LoginUseCase extends UseCase<void> {
  late final UserRepositoryImpLocal _repositoryImpLocal;
  late final UserAuthRepositoryImpl _authRepositoryImpl;

  LoginUseCase({
    UserRepositoryImpLocal? repositoryImpLocal,
    UserAuthRepositoryImpl? authRepositoryImpl,
    UserRepositoryFirebaseImpl? repositoryFirebase,
  }) {
    _repositoryImpLocal = repositoryImpLocal ?? UserRepositoryImpLocal.to;
    _authRepositoryImpl = authRepositoryImpl ?? UserAuthRepositoryImpl.to;
  }

  @override
  Future<void> perform(
      {UserEntity? user, String? email, String? password}) async {
    if (user == null) {
      await RemoteLoginUseCase(email: email!, password: password!).perform();
      return;
    }
    if (user.remoteId.isNotEmpty) {
      if (!await _authRepositoryImpl.requestAuth(user.toModel())) {
        return;
      }
    }
    await _repositoryImpLocal.changeUser(user.localId);

    Get.offAllNamed(Routes.home);
  }
}
