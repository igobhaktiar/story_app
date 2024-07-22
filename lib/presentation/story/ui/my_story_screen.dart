import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_story_app/core/utils/colors.dart';
import 'package:my_story_app/core/utils/text_style.dart';
import 'package:my_story_app/data/model/story_model.dart';
import 'package:my_story_app/data/model/user_model.dart';
import 'package:my_story_app/presentation/home/widget/story_list_items.dart';
import 'package:my_story_app/presentation/story/bloc/story_bloc/story_bloc.dart';
import 'package:my_story_app/presentation/widget/gradient_custom_widget.dart';

import '../../../domain/usecases/user_usecase.dart';

class MyStoryScreen extends StatefulWidget {
  const MyStoryScreen({super.key});

  @override
  State<MyStoryScreen> createState() => _MyStoryScreenState();
}

class _MyStoryScreenState extends State<MyStoryScreen> {
  List<StoryModel>? storyList;
  UserModel? user;

  @override
  void initState() {
    _userData();
    super.initState();
  }

  void _userData() async {
    user = await UserUseCase().getUserData();
    setState(() {});
  }

  void _storyHandler(StoryState state) {
    if (state is StoryLoaded) {
      storyList =
          state.stories.where((element) => element.userId == user?.id).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsAssets.primary,
      appBar: AppBar(
        backgroundColor: ColorsAssets.raisinBlack,
        title: Row(
          children: [
            Text(
              'My Story',
              style: appBarTitleTextStyle,
            ),
            const SizedBox(width: 10),
            const Icon(
              FluentIcons.book_24_regular,
              size: 30,
              color: Colors.white,
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          const GradientCustomWidget(),
          Padding(
            padding: const EdgeInsets.all(24),
            child: BlocBuilder<StoryBloc, StoryState>(
              builder: (context, state) {
                _storyHandler(state);
                return ListView.builder(
                  itemCount: storyList?.length ?? 0,
                  itemBuilder: (context, index) {
                    final story = storyList![index];
                    return StoryListItems(
                      data: story,
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
