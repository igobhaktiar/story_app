import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_story_app/core/utils/colors.dart';
import 'package:my_story_app/presentation/search/ui/search_scren.dart';
import 'package:my_story_app/presentation/user/bloc/user_bloc.dart';
import 'package:my_story_app/presentation/user/ui/login_screen.dart';
import 'package:my_story_app/presentation/main_screen.dart';
import 'package:my_story_app/presentation/user/ui/profile_screen.dart';
import 'package:my_story_app/presentation/user/ui/register_screen.dart';
import 'package:my_story_app/presentation/splash/ui/splash_screen.dart';
import 'package:my_story_app/presentation/story/bloc/story_bloc/story_bloc.dart';
import 'package:my_story_app/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_dependency_injection.dart';
import 'presentation/splash/bloc/splash_bloc.dart';

void main() {
  AppDependencyInjection.setup();
  final SplashBloc splashBloc = GetIt.I.get<SplashBloc>();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<StoryBloc>(
          create: (context) => GetIt.I.get<StoryBloc>()..add(StoryFetchEvent()),
        ),
        BlocProvider<SplashBloc>(
          create: (context) => splashBloc..add(SplashStart()),
        ),
        BlocProvider<UserBloc>(
          create: (context) => GetIt.I.get<UserBloc>(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Story',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: ColorsAssets.primary),
        fontFamily: 'Poppins',
        useMaterial3: true,
      ),
      initialRoute: Routes.splash,
      routes: {
        Routes.splash: (context) => const SplashScreen(),
        Routes.main: (context) => const MainScreen(),
        Routes.login: (context) => const LoginScreen(),
        Routes.register: (context) => const RegisterScreen(),
        Routes.profile: (context) => const ProfileScreen(),
        Routes.search: (context) => const SearchScreen(),
      },
    );
  }
}
