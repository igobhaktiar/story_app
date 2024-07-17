import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_story_app/core/utils/colors.dart';
import 'package:my_story_app/presentation/story/bloc/story_bloc/story_bloc.dart';
import 'package:my_story_app/presentation/story/ui/my_story_screen.dart';
import 'package:my_story_app/presentation/user/ui/profile_screen.dart';
import 'package:my_story_app/presentation/widget/toast_widget.dart';
import 'package:my_story_app/presentation/story/ui/write_story_screen.dart';

import 'home/ui/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // Define the controller
  int controller = 0;

  // Define the bottom navigation bar items
  final List<DotNavigationBarItem> _bottomNavigationBarItems = [
    DotNavigationBarItem(
      icon: const Icon(FluentIcons.home_24_regular),
      selectedColor: Colors.white,
    ),
    DotNavigationBarItem(
      icon: const Icon(FluentIcons.edit_24_regular),
      selectedColor: Colors.white,
    ),
    DotNavigationBarItem(
      icon: const Icon(FluentIcons.book_24_regular),
      selectedColor: Colors.white,
    ),
    DotNavigationBarItem(
      icon: const Icon(FluentIcons.person_24_regular),
      selectedColor: Colors.white,
    ),
  ];

  // Define the pages
  List<Widget> _pages() {
    return [
      const HomeScreen(),
      const WriteStoryScreen(),
      const MyStoryScreen(),
      const ProfileScreen(),
    ];
  }

  // Handle the bottom navigation bar item tap
  @override
  void initState() {
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      controller = index;
    });
  }

  void _refresh() {
    context.read<StoryBloc>().add(StoryFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<StoryBloc, StoryState>(
          listener: (context, state) {
            if (state is StoryError) {
              toastWidget(
                message: state.message,
                color: ColorsAssets.failed,
                textColor: Colors.white,
              );
            } else if (state is StoryUpdated) {
              toastWidget(
                message: 'Story Updated',
                color: ColorsAssets.success,
                textColor: Colors.white,
              );
              _refresh();
            } else if (state is StoryCreated) {
              toastWidget(
                message: 'Story Published',
                color: ColorsAssets.success,
                textColor: Colors.white,
              );
              _refresh();
            }
          },
        ),
      ],
      child: Scaffold(
        body: _pages()[controller],
        extendBody: true,
        bottomNavigationBar: DotNavigationBar(
          paddingR: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          marginR: const EdgeInsets.symmetric(horizontal: 18),
          itemPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          backgroundColor: ColorsAssets.night.withOpacity(0.8),
          currentIndex: controller,
          unselectedItemColor: Colors.grey[400],
          splashBorderRadius: 50,
          items: _bottomNavigationBarItems,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
