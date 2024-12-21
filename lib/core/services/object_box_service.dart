import 'package:appointments_manager/core/services/profile_service.dart';
import 'package:appointments_manager/objectbox.g.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;



class ObjectBoxService extends GetxService{
  late final Rx<Store>? store;
  static ObjectBoxService get to => Get.find<ObjectBoxService>();

  @override
  void onInit() {
    super.onInit();
    ever(ProfileService.to.profile, init);
  }

  Future<ObjectBoxService> init(int profile) async {
    final docsDir = await getApplicationDocumentsDirectory();
    if(store!=null){
      store!.value=await openStore(directory: p.join(docsDir.path, "user$profile"));
    } else {
      store = Rx<Store>(await openStore(directory: p.join(docsDir.path, "user$profile")));
    }
    return this;
  }
}