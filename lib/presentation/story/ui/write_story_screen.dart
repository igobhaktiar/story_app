import 'package:flutter/material.dart';
import 'package:my_story_app/core/utils/text_style.dart';
import 'package:intl/intl.dart';
import '../../../core/utils/colors.dart';

class WriteStoryScreen extends StatefulWidget {
  const WriteStoryScreen({super.key});

  @override
  State<WriteStoryScreen> createState() => _WriteStoryScreenState();
}

class _WriteStoryScreenState extends State<WriteStoryScreen> {
  String date = DateFormat('MMMM dd kk:mm').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsAssets.primary,
      appBar: AppBar(
        backgroundColor: ColorsAssets.primary,
        title: Text(
          'Write Story',
          style: appBarTitleTextStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                height: MediaQuery.of(context).size.height * 0.7,
                decoration: BoxDecoration(
                  color: ColorsAssets.eerieBlack.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      style: inputTitleTextStyle,
                      decoration: InputDecoration(
                        hintText: 'Story Title...',
                        hintStyle: inputHintTitleTextStyle,
                        focusColor: ColorsAssets.grey,
                        fillColor: ColorsAssets.grey,
                        border: InputBorder.none,
                      ),
                    ),
                    Text(
                      date,
                      style: bodyTextStyle,
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: TextField(
                        style: inputTextStyle,
                        decoration: InputDecoration(
                          hintText: 'Write your story here...',
                          hintStyle: hintTextStyle,
                          border: InputBorder.none,
                        ),
                        maxLines: 10,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.format_bold,
                            color: ColorsAssets.white,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.format_italic,
                            color: ColorsAssets.white,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.format_underline,
                            color: ColorsAssets.white,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.format_align_left,
                            color: ColorsAssets.white,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.format_align_center,
                            color: ColorsAssets.white,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.format_align_right,
                            color: ColorsAssets.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all(ColorsAssets.secondary),
                    padding: WidgetStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    ),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  child: Text(
                    'Publish',
                    style: buttonTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
