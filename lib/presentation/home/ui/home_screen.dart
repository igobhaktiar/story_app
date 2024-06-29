import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:my_story_app/core/utils/colors.dart';
import 'package:my_story_app/core/utils/text_style.dart';
import 'package:my_story_app/data/model/story_model.dart';
import 'package:my_story_app/presentation/bloc/story_bloc/story_bloc.dart';
import 'package:my_story_app/presentation/home/widget/carousel_item_widget.dart';
import 'package:my_story_app/presentation/home/widget/story_list_items.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _current = 0;
  // data
  List<StoryModel>? _topStories;

  @override
  void initState() {
    super.initState();
  }

  void _storyHandler(StoryState state) {
    if (state is StoryLoaded) {
      _topStories = state.stories;
      _topStories?.sort((a, b) => a.like!.compareTo(b.like!));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsAssets.primary,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Text(
                'Welcome to My Story App',
                style: titleTextStyle,
              ),
              const SizedBox(height: 8),
              Text(
                'This is a simple app to write your story',
                style: subtitleTextStyle,
              ),
              const SizedBox(height: 24),
              Text(
                'Top Stories',
                style: cardTitleTextStyle,
              ),
              const SizedBox(height: 16),
              BlocBuilder<StoryBloc, StoryState>(
                builder: (context, state) {
                  _storyHandler(state);
                  return Skeletonizer(
                    enabled: state is StoryLoading,
                    child: CarouselSlider.builder(
                      itemCount: 5,
                      itemBuilder: (context, index, realIndex) {
                        var storyModel = _topStories?[index];
                        return  CarouselItemWidget(storyModel: storyModel);
                      },
                      options: CarouselOptions(
                        height: 220,
                        aspectRatio: 16 / 9,
                        viewportFraction: 1,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 10),
                        autoPlayAnimationDuration: const Duration(
                            milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (index, reason) {
                          setState(
                                () {
                              _current = index;
                            },
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _current == index
                          ? ColorsAssets.white
                          : ColorsAssets.grey,
                    ),
                  );
                }),
              ),
              const SizedBox(height: 24),
              Text(
                'New Stories',
                style: cardTitleTextStyle,
              ),
              SizedBox(
                child: ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return const StoryListItems();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
