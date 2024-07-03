import 'package:my_story_app/data/model/user_model.dart';

abstract class UserRepository {
  Future<List<UserModel>> getUsers();

  Future<List<UserModel>> loginUser({
    required String username,
    required String password,
  });
}
