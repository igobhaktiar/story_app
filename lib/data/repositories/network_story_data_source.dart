import 'package:dio/dio.dart';
import 'package:my_story_app/core/utils/url.dart';
import 'package:my_story_app/data/model/story_model.dart';
import 'dart:convert';

class NetworkStoryDataSource {
  final Dio dio;

  NetworkStoryDataSource(this.dio);

  Future<List<StoryModel>> getStories() async {
    var response = await dio.get('$baseUrl/storylist');
    if (response.statusCode == 200) {
      List<StoryModel> storyModel = response.data
          .map<StoryModel>((item) => StoryModel.fromJson(item))
          .toList();
      return storyModel;
    } else {
      return [];
    }
  }

  Future<List<StoryModel>> getUserStories(String userId) async {
    var response = await dio.get('$baseUrl/users/$userId/storylist');
    if (response.statusCode == 200) {
      List<StoryModel> storyModel = response.data
          .map<StoryModel>((item) => StoryModel.fromJson(item))
          .toList();
      return storyModel;
    } else {
      return [];
    }
  }

  Future<StoryModel> updateStory(StoryModel story) async {
    var url = '$baseUrl/users/${story.userId}/storylist/${story.id}';

    List<Map<String, dynamic>>? comments;
    comments = story.comments
        ?.map((e) => {
              'name': e.name,
              'comment_reader': e.commentReader,
            })
        .toList();

    var body = jsonEncode({
      'writer': story.writer,
      'title': story.title,
      'story': story.story,
      'comments': comments,
    });

    var response = await dio.put(url, data: body);
    if (response.statusCode == 200) {
      return StoryModel.fromJson(response.data);
    } else {
      throw Exception('Failed to update story');
    }
  }
}
