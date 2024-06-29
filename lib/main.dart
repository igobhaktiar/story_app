import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_story_app/core/utils/colors.dart';
import 'package:my_story_app/presentation/main_screen.dart';
import 'package:my_story_app/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_story_app/presentation/bloc/story_bloc/story_bloc.dart';

import 'app_dependency_injection.dart';

void main() {
  AppDependencyInjection.setup();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<StoryBloc>(
          create: (context) => GetIt.I.get<StoryBloc>()..add(StoryFetchEvent()),
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
      initialRoute: '/',
      routes: {
        Routes.main: (context) => const MainScreen(),
      },
    );
  }
}
