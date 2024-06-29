import 'package:get_it/get_it.dart';
import 'package:my_story_app/domain/repositories/story_repository.dart';
import 'package:my_story_app/data/repositories/story_repository_impl.dart';
import 'package:my_story_app/domain/usecases/story_usecase.dart';
import 'package:my_story_app/presentation/bloc/story_bloc/story_bloc.dart';
import 'package:my_story_app/data/repositories/network_story_data_source.dart';

class AppDependencyInjection {
  static void setup() {
    //DataSource
    GetIt.I.registerLazySingleton<NetworkStoryDataSource>(
        () => NetworkStoryDataSource());
    // Repository
    GetIt.I.registerLazySingleton<StoryRepository>(() => StoryRepositoryImpl());
    // UseCase
    GetIt.I.registerLazySingleton<StoryUseCase>(() => StoryUseCase());
    // Bloc
    GetIt.I
        .registerFactory<StoryBloc>(() => StoryBloc(GetIt.instance.get()));
  }
}
