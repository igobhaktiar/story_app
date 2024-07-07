import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:my_story_app/data/repositories/local_user_data_source.dart';
import 'package:my_story_app/data/repositories/network_user_data_source.dart';
import 'package:my_story_app/domain/repositories/story_repository.dart';
import 'package:my_story_app/data/repositories/story_repository_impl.dart';
import 'package:my_story_app/domain/repositories/user_repository.dart';
import 'package:my_story_app/domain/usecases/story_usecase.dart';
import 'package:my_story_app/data/repositories/network_story_data_source.dart';
import 'package:my_story_app/presentation/user/bloc/user_bloc.dart';
import 'package:my_story_app/presentation/splash/bloc/splash_bloc.dart';
import 'package:my_story_app/presentation/story/bloc/story_bloc/story_bloc.dart';

import 'data/repositories/user_repository_impl.dart';
import 'domain/usecases/user_usecase.dart';

class AppDependencyInjection {
  static void setup() {
    //DataSource
    GetIt.I.registerLazySingleton<NetworkStoryDataSource>(
        () => NetworkStoryDataSource(GetIt.I.get<Dio>()));

    GetIt.I.registerLazySingleton<NetworkUserDataSource>(
        () => NetworkUserDataSource(GetIt.I.get<Dio>()));

    GetIt.I.registerLazySingleton<LocalUserDataSource>(
        () => LocalUserDataSource());

    GetIt.I.registerLazySingleton<Dio>(() => Dio());
    // Repository
    GetIt.I.registerLazySingleton<StoryRepository>(() => StoryRepositoryImpl());

    GetIt.I.registerLazySingleton<UserRepository>(() => UserRepositoryImpl());
    // UseCase
    GetIt.I.registerLazySingleton<StoryUseCase>(() => StoryUseCase());

    GetIt.I.registerLazySingleton<UserUseCase>(() => UserUseCase());
    // Bloc
    GetIt.I.registerFactory<StoryBloc>(
        () => StoryBloc(GetIt.I.get<StoryUseCase>()));

    GetIt.I.registerFactory<SplashBloc>(() => SplashBloc());

    GetIt.I.registerFactory<UserBloc>(
        () => UserBloc(GetIt.I.get<UserUseCase>()));
  }
}
