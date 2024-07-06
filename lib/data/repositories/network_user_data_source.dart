import 'package:my_story_app/core/utils/url.dart';
import 'package:my_story_app/data/model/user_model.dart';
import 'package:dio/dio.dart';

class NetworkUserDataSource {
  final Dio dio;

  NetworkUserDataSource(this.dio);

  Future<List<UserModel>> getUsers() async {
    var response = await dio.get('$baseUrl/users');

    if (response.statusCode == 200) {
      List<UserModel> userModel = response.data
          .map<UserModel>((item) => UserModel.fromJson(item))
          .toList();
      return userModel;
    } else {
      return [];
    }
  }

  Future<List<UserModel>> loginUser(String username, String password) async {
    var response =
        await dio.get('$baseUrl/users?username=$username&password=$password');

    if (response.statusCode == 200) {
      List<UserModel> userModel = response.data
          .map<UserModel>((item) => UserModel.fromJson(item))
          .toList();
      return userModel;
    } else {
      return [];
    }
  }

  Future<UserModel?> registerUser({
    required String name,
    required String email,
    required String username,
    required String password,
  }) async {
    var response = await dio.post('$baseUrl/users', data: {
      'name': name,
      'email': email,
      'username': username,
      'password': password,
    });

    if (response.statusCode == 201) {
      return UserModel.fromJson(response.data);
    } else {
      return null;
    }
  }
}
