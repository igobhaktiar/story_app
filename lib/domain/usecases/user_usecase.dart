import 'package:my_story_app/data/model/user_model.dart';
import 'package:my_story_app/data/repositories/user_repository_impl.dart';
import 'package:my_story_app/domain/repositories/user_repository.dart';

class UserUseCase {
  final UserRepository _userRepository = UserRepositoryImpl();

  Future<List<UserModel>> getUsers() {
    return _userRepository.getUsers();
  }

  Future<List<UserModel>> loginUser({
    required String username,
    required String password,
  }) {
    return _userRepository.loginUser(username: username, password: password);
  }

  Future<void> saveUserData(UserModel userModel) {
    return _userRepository.saveUserData(userModel);
  }

  Future<UserModel> getUserData() {
    return _userRepository.getUserData();
  }

  Future<void> setLoginState(bool isLoggedIn) {
    return _userRepository.setLoginState(isLoggedIn);
  }

  Future<bool> getLoginState() {
    return _userRepository.getLoginState();
  }

  Future<void> clearUserData() {
    return _userRepository.clearUserData();
  }
}
