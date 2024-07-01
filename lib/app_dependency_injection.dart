import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:my_story_app/domain/repositories/story_repository.dart';
import 'package:my_story_app/data/repositories/story_repository_impl.dart';
import 'package:my_story_app/domain/usecases/story_usecase.dart';
import 'package:my_story_app/data/repositories/network_story_data_source.dart';
import 'package:my_story_app/presentation/splash/bloc/splash_bloc.dart';
import 'package:my_story_app/presentation/story/bloc/story_bloc/story_bloc.dart';

class AppDependencyInjection {
  static void setup() {
    //DataSource
    GetIt.I.registerLazySingleton<NetworkStoryDataSource>(
        () => NetworkStoryDataSource(GetIt.instance.get()));
    GetIt.I.registerLazySingleton<Dio>(() => Dio());
    // Repository
    GetIt.I.registerLazySingleton<StoryRepository>(() => StoryRepositoryImpl());
    // UseCase
    GetIt.I.registerLazySingleton<StoryUseCase>(() => StoryUseCase());
    // Bloc
    GetIt.I.registerFactory<StoryBloc>(() => StoryBloc(GetIt.instance.get()));

    GetIt.I.registerFactory<SplashBloc>(() => SplashBloc());
  }
}
