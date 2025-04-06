import 'package:appointments_manager/core/abstractions/usecases.dart';

import '../../data/repositories/user_auth_repository_impl.dart';

class SignUpUseCase extends UseCase<String>{
  late final UserAuthRepositoryImpl authRepositoryImpl;
  final String email;
  final String password;

  SignUpUseCase({
    required this.email,
    required this.password,
    UserAuthRepositoryImpl? authRepositoryImpl,
  }){
    this.authRepositoryImpl = authRepositoryImpl ?? UserAuthRepositoryImpl.to;
  }
  @override
  Future<String> perform() async{
     await authRepositoryImpl.signUpWithEmailAndPassword(email, password);
      final String? userId = await authRepositoryImpl.getCurrentUserId();
      if(userId == null){
        throw Exception("User ID is null");
      }

      return userId;
  }
}