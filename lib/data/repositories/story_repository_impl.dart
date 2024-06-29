import 'package:my_story_app/data/model/story_model.dart';
import 'package:my_story_app/data/repositories/network_story_data_source.dart';
import 'package:my_story_app/domain/repositories/story_repository.dart';
import 'package:get_it/get_it.dart';

class StoryRepositoryImpl implements StoryRepository {
  final NetworkStoryDataSource networkStoryDataSource =
      GetIt.I<NetworkStoryDataSource>();

  @override
  Future<List<StoryModel>> getStories() {
    return networkStoryDataSource.getStories();
  }

  @override
  Future<List<StoryModel>> getUserStories(String userId) {
    return networkStoryDataSource.getUserStories(userId);
  }

  @override
  Future<StoryModel> updateStory(StoryModel story) {
    return networkStoryDataSource.updateStory(story);
  }
}
