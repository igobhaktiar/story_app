import 'package:get_it/get_it.dart';
import 'package:my_story_app/data/model/user_model.dart';
import 'package:my_story_app/data/repositories/network_user_data_source.dart';
import 'package:my_story_app/domain/repositories/user_repository.dart';

import 'local_user_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final NetworkUserDataSource networkUserDataSource =
      GetIt.I<NetworkUserDataSource>();

  final LocalUserDataSource localUserDataSource =
      GetIt.I<LocalUserDataSource>();

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

  @override
  Future<UserModel?> registerUser({
    required String name,
    required String email,
    required String username,
    required String password,
  }) {
    return networkUserDataSource.registerUser(
      name: name,
      email: email,
      username: username,
      password: password,
    );
  }

  @override
  Future<void> saveUserData(UserModel userModel) {
    return localUserDataSource.saveUserData(userModel);
  }

  @override
  Future<UserModel> getUserData() {
    return localUserDataSource.getUserData();
  }

  @override
  Future<void> setLoginState(bool isLoggedIn) {
    return localUserDataSource.setLoginState(isLoggedIn);
  }

  @override
  Future<bool> getLoginState() {
    return localUserDataSource.getLoginState();
  }

  @override
  Future<void> clearUserData() {
    return localUserDataSource.clearUserData();
  }
}
