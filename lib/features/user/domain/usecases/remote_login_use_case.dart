import 'package:appointments_manager/core/abstractions/usecases.dart';

import '../../data/repositories/user_auth_repository_impl.dart';
import '../../data/repositories/user_repository_firebase_impl.dart';
import '../../data/repositories/user_repository_impl_local.dart';

class RemoteLoginUseCase extends UseCase<void> {
  late final UserRepositoryImpLocal _repositoryImpLocal;
  late final UserRepositoryFirebaseImpl _repositoryFirebase;
  late final UserAuthRepositoryImpl _authRepositoryImpl;
  final String email;
  final String password;

  RemoteLoginUseCase({
    required this.email,
    required this.password,
    UserRepositoryImpLocal? repositoryImpLocal,
    UserAuthRepositoryImpl? authRepositoryImpl,
    UserRepositoryFirebaseImpl? repositoryFirebase,
  }) {
    _repositoryImpLocal = repositoryImpLocal ?? UserRepositoryImpLocal.to;
    _authRepositoryImpl = authRepositoryImpl ?? UserAuthRepositoryImpl.to;
    _repositoryFirebase = repositoryFirebase ?? UserRepositoryFirebaseImpl.to;
  }
  @override
  Future<void> perform() async {
    final result = await _authRepositoryImpl.signInWithEmailAndPassword(email, password);
    if (result == null) {
      return;
    }
    final user = await _repositoryFirebase.getUser(result.user!.uid);
    var localUser = await _repositoryImpLocal.getUserByRemoteId(user.remoteId);
    if(localUser == null) {
      localUser= await _repositoryImpLocal.createUser(user);
      return;
    }
    await _repositoryImpLocal.changeUser(localUser.localId);

    // Navigate to home screen or perform any other action
    // Get.offAllNamed(Routes.home);{

  }
}