import 'package:appointments_manager/features/user/data/datasource/local_user_datasource.dart';
import 'package:appointments_manager/features/user/data/models/users_model.dart';
import 'package:appointments_manager/features/user/data/repositories/user_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'save_user_data_test.mocks.dart';

@GenerateMocks([LocalUserDatasource, UserDataRepositoryImpLocal])
void main() {
  late MockUserDataRepositoryImpLocal userDataRepositoryImpLocal;

  setUpAll(
    () {
      userDataRepositoryImpLocal = MockUserDataRepositoryImpLocal();
    },
  );

  group('Save user data', ()
  {
    test('Should save user data', () async {
      final user = UserModel(name: 'John Doe', email: 'fakeEmail@gmail.com' );

      when(userDataRepositoryImpLocal.saveUser(user)).thenAnswer((_) async {return;});
      await userDataRepositoryImpLocal.saveUser(user);
      verify(userDataRepositoryImpLocal.saveUser(user));
    });
    test('Error should throw and exception', () async {
      final user = UserModel(name: 'John Doe', email: 'fakeEmail@gmail.com');
      when(userDataRepositoryImpLocal.saveUser(user)).thenThrow(Exception());
      expect(() => userDataRepositoryImpLocal.saveUser(user), throwsException);
    });

  }); // group
}
