import 'package:flutter/cupertino.dart';
import 'package:my_story_app/core/utils/colors.dart';
import 'package:my_story_app/core/utils/text_format.dart';
import 'package:my_story_app/data/model/story_model.dart';

import '../../../core/utils/text_style.dart';

class StoryListItems extends StatelessWidget {
  const StoryListItems({
    super.key,
    required this.data,
  });

  final StoryModel? data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            ColorsAssets.blackOlive,
            ColorsAssets.gunmetal,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                data?.title ?? 'Lorem Ipsum',
                style: cardTitleTextStyle,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            data?.story ?? 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s.',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: subtitleTextStyle,
          ),
          const SizedBox(height: 8),
          Text(
            'By: ${data?.writer ?? 'Lorem Ipsum'}',
            style: cardBodyTextStyle,
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    CupertinoIcons.calendar,
                    color: ColorsAssets.white,
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    data != null ? formatDate(data!.createdAt) : 'Saturday, 12 June 2021',
                    style: cardBodyTextStyle,
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    CupertinoIcons.heart,
                    color: ColorsAssets.white,
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    data?.like.toString() ?? '1212',
                    style: cardBodyTextStyle,
                  ),
                  const SizedBox(width: 16),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    CupertinoIcons.chat_bubble,
                    color: ColorsAssets.white,
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  Text( data?.comments?.length.toString() ?? '1212',
                    style: cardBodyTextStyle,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
