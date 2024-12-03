import 'package:appointments_manager/services/profile_service.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import '../objectbox.g.dart';

class ObjectBoxService extends GetxService{
  final Rxn<Store> store = Rxn<Store>();
  static ObjectBoxService get to => Get.find<ObjectBoxService>();

  @override
  void onInit() {
    super.onInit();
    ever(ProfileService.to.profile, init);
  }

  Future<ObjectBoxService> init(int profile) async {
    final docsDir = await getApplicationDocumentsDirectory();
    store.value = await openStore(directory: p.join(docsDir.path, "user$profile"));
    return this;
  }
}