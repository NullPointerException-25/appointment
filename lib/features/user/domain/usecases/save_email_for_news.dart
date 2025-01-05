import 'package:appointments_manager/core/abstractions/usecases.dart';
import 'package:appointments_manager/features/user/data/repositories/user_repository_firebase_analytics_impl.dart';

class SaveEmailForNewsUseCase extends Usecases {
  final String email;
  late final UserRepositoryFirebaseAnalyticsImpl _firebaseRepository;

  SaveEmailForNewsUseCase(this.email,
      {UserRepositoryFirebaseAnalyticsImpl? repository}) {
    _firebaseRepository = repository ?? UserRepositoryFirebaseAnalyticsImpl.to;
  }

  @override
  Future<void> perform() async {
    if (email.isEmpty) {
      return;
    }
    await _firebaseRepository.sendEmailForNews(email);
    return;
  }
}
