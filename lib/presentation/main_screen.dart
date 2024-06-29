import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:my_story_app/core/utils/colors.dart';
import 'package:my_story_app/presentation/search/ui/search_scren.dart';
import 'package:my_story_app/presentation/story/ui/story_screen.dart';
import 'package:my_story_app/presentation/write/ui/write_screen.dart';

import 'home/ui/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int controller = 0;

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
      icon: const Icon(FluentIcons.search_24_regular),
      selectedColor: Colors.white,
    ),
    DotNavigationBarItem(
      icon: const Icon(FluentIcons.book_24_regular),
      selectedColor: Colors.white,
    ),
  ];

  List<Widget> _pages() {
    return [
      const HomeScreen(),
      const WriteScreen(),
      const SearchScreen(),
      const StoryScreen(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      controller = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}