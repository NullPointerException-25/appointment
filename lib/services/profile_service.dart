import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import '../objectbox.g.dart';
import '../schema/users.dart';

class ProfileService extends GetxService {
  final RxInt profile = 0.obs;
  late final Rx<UserSchema> user;

  static ProfileService get to => Get.find<ProfileService>();
  late final Rx<Store> store;

   Future<ProfileService> init() async {
    final directory = await getApplicationDocumentsDirectory();
    store = (await openStore(directory: p.join(directory.path, 'default'))).obs;
    final getUsers = store.value.box<UserSchema>().getAll();
    if (getUsers.isEmpty) {
      createDefaultUser();
      return this;
    }
    final currentUser =
        getUsers.firstWhereOrNull((element) => element.isCurrentUser);
    if (currentUser != null) {
      changeProfile(currentUser.id);
      return this;
    }
    changeProfile(getUsers.first.id);
    return this;
  }

  void changeProfile(int id) {
    profile.value = id;
    store.value
        .box<UserSchema>()
        .put(store.value.box<UserSchema>().get(id)!..isCurrentUser = true);
    final otherUser = store.value.box<UserSchema>().get(profile.value);
    if (otherUser != null && id != profile.value) {
      store.value.box<UserSchema>().put(otherUser..isCurrentUser = false);
    }
    user = store.value.box<UserSchema>().get(profile.value)!.obs;
  }

  void createDefaultUser() {
    int id = store.value.box<UserSchema>().put(UserSchema(
          id: 0,
          name: '',
          imagePath: null,
          email: null,
          isCurrentUser: true,
        ));
    changeProfile(id);
  }
}
