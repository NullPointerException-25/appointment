import 'package:appointments_manager/features/user/domain/entities/user_entity.dart';

import '../../../../core/abstractions/usecases.dart';
import '../../data/repositories/user_repository_impl_local.dart';

class CreateNewUser extends UseCase<UserEntity> {
  final String name;
  final String email;
  final String imagePath;
  late final UserRepositoryImpLocal _localRepository;

  CreateNewUser({
    required this.name,
    required this.email,
    required this.imagePath,
    UserRepositoryImpLocal? localRepository,
  }){
    _localRepository = localRepository ?? UserRepositoryImpLocal.to;
  }

  @override
  Future<UserEntity> perform() async {
    final user = UserEntity(
      email: email,
      imagePath: imagePath,
      name: name,
      lastUpdate: DateTime.now(),
    );
    await _localRepository.createUser(user.toModel());
    return user;
  }
}