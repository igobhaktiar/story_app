import 'package:my_story_app/data/model/user_model.dart';

abstract class UserRepository {
  Future<List<UserModel>> getUsers();

  Future<List<UserModel>> loginUser({
    required String username,
    required String password,
  });

  Future<void> saveUserData(UserModel userModel);

  Future<UserModel> getUserData();

  Future<void> setLoginState(bool isLoggedIn);

  Future<bool> getLoginState();

  Future<void> clearUserData();
}
