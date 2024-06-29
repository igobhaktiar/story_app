import 'package:my_story_app/data/model/story_model.dart';

abstract class StoryRepository {
  Future<List<StoryModel>> getStories();
  Future<List<StoryModel>> getUserStories(String userId);
  Future<StoryModel> updateStory(StoryModel story);
}