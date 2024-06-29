import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_story_app/core/utils/colors.dart';

import '../../../core/utils/text_style.dart';

class StoryListItems extends StatelessWidget {
  const StoryListItems({
    super.key,
  });

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
                'Lorem Ipsum Dolor Sit Amet',
                style: cardTitleTextStyle,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nec odio vitae nunc. '
                'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; ',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: subtitleTextStyle,
          ),
          const SizedBox(height: 8),
          Text(
            'By: John Doe',
            style: cardBodyTextStyle,
          ),
          const SizedBox(height: 8),
          Row(
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
                    'Saturday, 12 June 2021',
                    style: cardBodyTextStyle,
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Row(
                children: [
                  const Icon(
                    CupertinoIcons.heart,
                    color: ColorsAssets.white,
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '100 Likes',
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
