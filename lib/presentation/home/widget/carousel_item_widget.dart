import 'package:flutter/material.dart';
import 'package:my_story_app/data/model/story_model.dart';
import 'package:my_story_app/presentation/story/ui/details_story_screen.dart';

import '../../../core/utils/colors.dart';

class CarouselItemWidget extends StatelessWidget {
  const CarouselItemWidget({
    super.key,
    required this.storyModel,
  });

  final StoryModel? storyModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            ColorsAssets.wenge,
            ColorsAssets.raisinBlack,
          ],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        height: 200,
        padding: const EdgeInsets.all(8),
        width: double.infinity,
        child: Row(
          children: [
            Container(
              width: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: ColorsAssets.white,
                image: DecorationImage(
                  image: NetworkImage(
                      storyModel?.images ?? 'https://via.placeholder.com/150'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    storyModel?.title ?? '',
                    style: const TextStyle(
                      color: ColorsAssets.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    storyModel?.story ?? '',
                    style: const TextStyle(
                      color: ColorsAssets.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'By ${storyModel?.writer}',
                    style: const TextStyle(
                      color: ColorsAssets.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailsStoryScreen(storyModel: storyModel),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsAssets.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Read More',
                      style: TextStyle(
                        color: ColorsAssets.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
