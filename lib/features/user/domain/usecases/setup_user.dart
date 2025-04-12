import 'package:appointments_manager/core/abstractions/usecases.dart';
import 'package:appointments_manager/core/utils/routes.dart';
import 'package:appointments_manager/features/user/domain/usecases/create_new_user.dart';
import 'package:appointments_manager/features/user/domain/usecases/save_profile_image_on_storage_use_case.dart';
import 'package:appointments_manager/features/user/domain/usecases/signup.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class SetupUserUseCase extends UseCase {
  final String name;
  final String email;
  final String imagePath;
  final String? password;
  String remoteId = "";

  SetupUserUseCase({
    required this.name,
    required this.email,
    required this.imagePath,
    this.password,
  });

  @override
  Future<void> perform({bool isRemoteSignUp = false}) async {
    if (isRemoteSignUp) {
      assert(password != null);
      remoteId = await SignUpUseCase(
        email: email,
        password: password!,
      ).perform();
    }
    await CreateNewUser(
            imagePath: imagePath, name: name, email: email, remoteId: remoteId)
        .perform();
    if (imagePath.isNotEmpty) {
      final result =
          await SaveProfileImageOnStorageUseCase(imagePath).perform();
      if (result.hasError) {
        return;
      }
    }
    Get.offAllNamed(Routes.home);
  }
}
