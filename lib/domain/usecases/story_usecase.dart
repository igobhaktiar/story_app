import 'package:my_story_app/data/model/story_model.dart';
import 'package:my_story_app/domain/repositories/story_repository.dart';
import 'package:my_story_app/data/repositories/story_repository_impl.dart';

class StoryUseCase {
  final StoryRepository storyRepository = StoryRepositoryImpl();

  Future<List<StoryModel>> getStories() {
    return storyRepository.getStories();
  }

  Future<List<StoryModel>> getUserStories(String userId) {
    return storyRepository.getUserStories(userId);
  }
}