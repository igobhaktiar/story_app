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
}
