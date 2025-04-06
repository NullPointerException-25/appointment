import 'package:appointments_manager/core/abstractions/usecases.dart';
import 'package:appointments_manager/features/user/data/repositories/user_auth_repository_impl.dart';
import 'package:get/get.dart';

import '../../../../core/utils/routes.dart';

class LogoutUseCase extends UseCase<void> {
  late final UserAuthRepositoryImpl _userAuthRepository;

  LogoutUseCase({UserAuthRepositoryImpl? userAuthRepository}) {
    _userAuthRepository = userAuthRepository ?? UserAuthRepositoryImpl.to;
  }
  @override
  Future<void> perform() async {
    bool hasRemoteSession = (await _userAuthRepository.getCurrentUserId()) != null;
       if(hasRemoteSession){
         await _userAuthRepository.signOut();
       }
       Get.offAllNamed(Routes.setup);

  }
}