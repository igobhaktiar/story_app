import 'package:get_it/get_it.dart';
import 'package:my_story_app/data/model/user_model.dart';
import 'package:my_story_app/data/repositories/network_user_data_source.dart';
import 'package:my_story_app/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final NetworkUserDataSource networkUserDataSource =
      GetIt.I<NetworkUserDataSource>();

  @override
  Future<List<UserModel>> getUsers() {
    return networkUserDataSource.getUsers();
  }

  @override
  Future<List<UserModel>> loginUser({
    required String username,
    required String password,
  }) {
    return networkUserDataSource.loginUser(username, password);
  }
}
