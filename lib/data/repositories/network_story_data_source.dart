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

  Future<StoryModel> updateStory(StoryModel story) async {
    var url = Uri.parse('$baseUrl/users/${story.userId}/storylist/${story.id}');
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

    var response = await http.put(
      url,
      body: body,
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      return StoryModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update story');
    }
  }
}
