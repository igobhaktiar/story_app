import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_story_app/data/model/story_model.dart';
import 'package:my_story_app/domain/usecases/story_usecase.dart';

part 'story_event.dart';

part 'story_state.dart';

class StoryBloc extends Bloc<StoryEvent, StoryState> {
  final StoryUseCase storyUseCase;

  StoryBloc(this.storyUseCase) : super(StoryInitial()) {
    on<StoryEvent>((event, emit) async {
      try {
        if (event is StoryFetchEvent) {
          emit(StoryLoading());
          final stories = await storyUseCase.getStories();
          if (stories.isEmpty) {
            emit(StoryError('No stories found'));
          } else {
            emit(StoryLoaded(stories));
          }
        } else if (event is StoryByUserEvent) {
          emit(StoryLoading());
          final stories = await storyUseCase.getUserStories(event.userId);
          if (stories.isEmpty) {
            emit(StoryError('No stories found'));
          } else {
            emit(StoryLoaded(stories));
          }
        } else if (event is StoryUpdateEvent) {
          emit(StoryLoading());
          StoryModel? story = await storyUseCase.updateStory(event.story);
          if (story.userId != null) {
            emit(StoryUpdated(story));
          } else {
            emit(StoryError('Failed to update story'));
          }
        }
      } catch (e) {
        emit(StoryError(e.toString()));
      }
    });
  }
}
