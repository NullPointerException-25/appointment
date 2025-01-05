import 'package:appointments_manager/core/abstractions/usecases.dart';
import 'package:appointments_manager/features/user/domain/entities/user_entity.dart';
import 'package:appointments_manager/features/user/domain/usecases/check_if_setup_completed_use_case.dart';
import 'package:appointments_manager/features/user/domain/usecases/save_email_for_news.dart';
import 'package:appointments_manager/features/user/domain/usecases/save_profile_image_on_storage_use_case.dart';
import 'package:appointments_manager/features/user/domain/usecases/save_user_use_case.dart';

class SetupUserUseCase extends Usecases {
  final String name;
  final String email;
  final String imagePath;

  SetupUserUseCase({
    required this.name,
    required this.email,
    required this.imagePath,
  });

  @override
  Future<void> perform() async {
    if (imagePath.isNotEmpty) {
      final result =
          await SaveProfileImageOnStorageUseCase(imagePath).perform();
      if (result.hasError) {
        return;
      }
    }
    await SaveEmailForNewsUseCase(email).perform();
    await SaveUserUseCase(
      UserEntity(
        email: email,
        imagePath: imagePath,
        name: name,
        lastUpdate: DateTime.now(),
      ),
    ).perform();

    CheckIfSetupCompletedUseCase().perform();
  }
}
