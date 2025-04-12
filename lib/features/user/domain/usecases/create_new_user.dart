import 'package:appointments_manager/features/user/data/repositories/user_repository_firebase_impl.dart';
import 'package:appointments_manager/features/user/domain/entities/user_entity.dart';

import '../../../../core/abstractions/usecases.dart';
import '../../data/repositories/user_repository_impl_local.dart';

class CreateNewUser extends UseCase<UserEntity> {
  final String name;
  final String email;
  final String imagePath;
  String remoteId="";
  late final UserRepositoryImpLocal _localRepository;
  late final UserRepositoryFirebaseImpl _firebaseRepository;

  CreateNewUser({
    required this.name,
    required this.email,
    required this.imagePath,
    this.remoteId="",
    UserRepositoryImpLocal? localRepository,
    UserRepositoryFirebaseImpl? firebaseRepository,
  }){
    _localRepository = localRepository ?? UserRepositoryImpLocal.to;
    _firebaseRepository = firebaseRepository ?? UserRepositoryFirebaseImpl.to;
  }

  @override
  Future<UserEntity> perform() async {
    final user = UserEntity(
      email: email,
      imagePath: imagePath,
      name: name,
      remoteId: remoteId,
      isSetupComplete: true,
      lastUpdate: DateTime.now(),
    );
    await _localRepository.createUser(user.toModel());
    await _firebaseRepository.saveUser(user.toModel());
    return user;
  }
}