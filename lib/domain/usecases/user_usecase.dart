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
}
