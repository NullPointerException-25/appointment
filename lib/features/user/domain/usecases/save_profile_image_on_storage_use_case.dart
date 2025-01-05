import 'package:appointments_manager/core/abstractions/usecases.dart';
import 'package:appointments_manager/features/user/data/repositories/user_repository_impl_local.dart';
import 'package:appointments_manager/features/user/domain/entities/user_image_result.dart';

class SaveProfileImageOnStorageUseCase extends Usecases{
  late final UserRepositoryImpLocal _repository;
  final String imagePath;
  SaveProfileImageOnStorageUseCase(this.imagePath,{ UserRepositoryImpLocal? repository}){
    _repository = repository??UserRepositoryImpLocal.to;
  }
  @override
  Future<UserImageResult> perform() async {
    try {
      final devicePath = await _repository.saveProfileImage(imagePath);
      return UserImageResult(image: devicePath);
    } catch (e) {
      return UserImageResult(hasError: true);
    }
  }
}