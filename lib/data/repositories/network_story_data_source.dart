import 'package:my_story_app/core/utils/url.dart';
import 'package:my_story_app/data/model/story_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkStoryDataSource {
  Future<List<StoryModel>> getStories() async {
    var url = Uri.parse('$baseUrl/storylist');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      List<StoryModel> storyModel = jsonDecode(response.body)
          .map<StoryModel>((item) => StoryModel.fromJson(item))
          .toList();
      return storyModel;
    } else {
      return [];
    }
  }

  Future<List<StoryModel>> getUserStories(String userId) async {
    var url = Uri.parse('$baseUrl/users/$userId/storylist');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      List<StoryModel> storyModel = jsonDecode(response.body)
          .map<StoryModel>((item) => StoryModel.fromJson(item))
          .toList();
      return storyModel;
    } else {
      return [];
    }
  }
}
