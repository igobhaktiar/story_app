import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_story_app/core/utils/colors.dart';
import 'package:my_story_app/core/utils/text_format.dart';
import 'package:my_story_app/core/utils/text_style.dart';
import 'package:my_story_app/data/model/story_model.dart';
import 'package:my_story_app/presentation/bloc/story_bloc/story_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../widget/tf_custom_widget.dart';

class DetailsStoryScreen extends StatefulWidget {
  const DetailsStoryScreen({super.key, this.storyModel});

  final StoryModel? storyModel;

  @override
  State<DetailsStoryScreen> createState() => _DetailsStoryScreenState();
}

class _DetailsStoryScreenState extends State<DetailsStoryScreen> {
  final TextEditingController _commentController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  List<Comments>? comments;

  final _commentFormKey = GlobalKey<FormState>();

  void _blocHandler(StoryState state) {
    if (state is StoryLoaded) {
      comments = state.stories
          .firstWhere((element) => element.id == widget.storyModel?.id)
          .comments;
    }
  }

  void _addComment() {
    if (_commentFormKey.currentState?.validate() ?? false) {
      var comment = Comments(
        name: _nameController.text,
        commentReader: _commentController.text,
      );
      comments?.add(comment);
      context.read<StoryBloc>().add(StoryUpdateEvent(StoryModel(
            id: widget.storyModel?.id,
            title: widget.storyModel?.title,
            writer: widget.storyModel?.writer,
            story: widget.storyModel?.story,
            userId: widget.storyModel?.userId,
            like: widget.storyModel?.like,
            createdAt: widget.storyModel?.createdAt,
            images: widget.storyModel?.images,
            comments: comments,
          )));
      _commentController.clear();
      _nameController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsAssets.primary,
        leading: IconButton(
          icon: const Icon(CupertinoIcons.back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: ColorsAssets.primary,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocBuilder<StoryBloc, StoryState>(
            builder: (context, state) {
              _blocHandler(state);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                            image:
                                NetworkImage(widget.storyModel?.images ?? ''),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(16),
                              bottomRight: Radius.circular(16),
                            ),
                            color: Colors.black.withOpacity(0.5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.storyModel?.title ?? ' ',
                                  style: titleTextStyle.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  widget.storyModel != null
                                      ? formatDate(widget.storyModel?.createdAt)
                                      : '',
                                  style: bodyTextStyle.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(16),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: ColorsAssets.eerieBlack.withOpacity(0.4),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Story',
                          style: subtitleTextStyle,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          widget.storyModel?.story ?? ' ',
                          style: bodyTextStyle,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: ColorsAssets.night.withOpacity(0.8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              CupertinoIcons.heart,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              widget.storyModel?.like.toString() ?? '0',
                              style: cardBodyTextStyle,
                            ),
                            Text(
                              ' Likes',
                              style: cardBodyTextStyle,
                            )
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              CupertinoIcons.chat_bubble,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              comments?.length.toString() ?? '0',
                              style: cardBodyTextStyle,
                            ),
                            Text(
                              ' Comments',
                              style: cardBodyTextStyle,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Form(
                    key: _commentFormKey,
                    child: Container(
                      margin: const EdgeInsets.only(top: 16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: ColorsAssets.night.withOpacity(0.8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Comments',
                            style: titleTextStyle,
                          ),
                          const SizedBox(height: 8),
                          Skeletonizer(
                            enabled: state is StoryLoading,
                            child: ListView.builder(
                              itemCount: comments?.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                var comment = comments?[index];
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          CupertinoIcons.person_fill,
                                          color: Colors.white,
                                          size: 16,
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          comment?.name ?? ' ',
                                          style: cardBodyTextStyle,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      comment?.commentReader ?? ' ',
                                      style: bodyTextStyle,
                                    ),
                                    const SizedBox(height: 8),
                                    const Divider(),
                                  ],
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Add Comment',
                            style: subtitleTextStyle,
                          ),
                          const SizedBox(height: 8),
                          TfCustomWidget(
                            nameController: _nameController,
                            text: 'Name',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Name is required';
                              }
                              return null;
                            },
                            height: 80,
                          ),
                          const SizedBox(height: 8),
                          TfCustomWidget(
                            nameController: _commentController,
                            text: 'Comment',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Comment is required';
                              }
                              return null;
                            },
                            height: 80,
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: _addComment,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorsAssets.secondary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: Text(
                              'Comment',
                              style: buttonTextStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
