part of 'story_bloc.dart';

@immutable
sealed class StoryEvent {}

class StoryFetchEvent extends StoryEvent {}

class StoryByUserEvent extends StoryEvent {
  final String userId;

  StoryByUserEvent(this.userId);
}
