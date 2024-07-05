import 'package:my_story_app/data/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalUserDataSource {
  Future<void> setLoginState(bool isLoggedIn) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool('isLoggedIn', isLoggedIn);
  }

  Future<bool> getLoginState() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool('isLoggedIn') ?? false;
  }

  Future<void> saveUserData(UserModel userModel) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('createdAt', userModel.createdAt ?? '');
    await sharedPreferences.setString('name', userModel.name ?? '');
    await sharedPreferences.setString('avatar', userModel.avatar ?? '');
    await sharedPreferences.setString('email', userModel.email ?? '');
    await sharedPreferences.setString('username', userModel.username ?? '');
    await sharedPreferences.setString('password', userModel.password ?? '');
    await sharedPreferences.setString('id', userModel.id ?? '');
  }

  Future<UserModel> getUserData() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return UserModel(
      createdAt: sharedPreferences.getString('createdAt'),
      name: sharedPreferences.getString('name'),
      avatar: sharedPreferences.getString('avatar'),
      email: sharedPreferences.getString('email'),
      username: sharedPreferences.getString('username'),
      password: sharedPreferences.getString('password'),
      id: sharedPreferences.getString('id'),
    );
  }

  Future<void> clearUserData() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }
}
