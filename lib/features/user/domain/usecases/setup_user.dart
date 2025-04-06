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
   String remoteId="";

  SetupUserUseCase({
    required this.name,
    required this.email,
    required this.imagePath,
  });

  @override
  Future<void> perform({bool isRemoteSignUp=false}) async {
    if (isRemoteSignUp){
      remoteId = await SignUpUseCase(
        email: email,
        password: email,
      ).perform();
    }
    await CreateNewUser(imagePath: imagePath, name: name, email: email, remoteId: remoteId).perform();
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
