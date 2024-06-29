part of 'story_bloc.dart';

@immutable
sealed class StoryState {}

final class StoryInitial extends StoryState {}

final class StoryLoading extends StoryState {}

final class StoryLoaded extends StoryState {
  final List<StoryModel> stories;

  StoryLoaded(this.stories);
}

final class StoryError extends StoryState {
  final String message;

  StoryError(this.message);
}
