part of 'story_bloc.dart';

@immutable
sealed class StoryEvent {}

class StoryFetchEvent extends StoryEvent {}

class StoryByUserEvent extends StoryEvent {
  final String userId;

  StoryByUserEvent(this.userId);
}

class StoryUpdateEvent extends StoryEvent {
  final StoryModel story;

  StoryUpdateEvent(this.story);
}

class StoryCreateEvent extends StoryEvent {
  final StoryModel story;

  StoryCreateEvent(this.story);
}
