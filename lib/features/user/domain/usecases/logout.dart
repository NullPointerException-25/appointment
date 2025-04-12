import 'package:appointments_manager/core/abstractions/usecases.dart';
import 'package:appointments_manager/features/user/data/repositories/user_auth_repository_impl.dart';
import 'package:appointments_manager/features/user/data/repositories/user_repository_impl_local.dart';
import 'package:get/get.dart';

import '../../../../core/utils/routes.dart';

class LogoutUseCase extends UseCase<void> {
  late final UserAuthRepositoryImpl _userAuthRepository;
  late final UserRepositoryImpLocal _repositoryImpLocal;

  LogoutUseCase({UserAuthRepositoryImpl? userAuthRepository, UserRepositoryImpLocal? userRepositoryImpLocal}) {
    _userAuthRepository = userAuthRepository ?? UserAuthRepositoryImpl.to;
    _repositoryImpLocal = UserRepositoryImpLocal.to;
  }
  @override
  Future<void> perform() async {
    bool hasRemoteSession = (await _userAuthRepository.getCurrentUserId()) != null;
       if(hasRemoteSession){
         await _userAuthRepository.signOut();
       }
       await _repositoryImpLocal.detachUserDatabase();
       Get.offAllNamed(Routes.setup);

  }
}