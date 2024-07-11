import 'package:fluentui_system_icons/fluentui_system_icons.dart';
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
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _storyController = TextEditingController();

  void _boldText() {
    final String value = _storyController.text;
    final int start = _storyController.selection.start;
    final int end = _storyController.selection.end;
    final String selectedText = value.substring(start, end);
    final String newText = value.replaceRange(start, end, '**$selectedText**');
    _storyController.text = newText;
  }

  void _italicText() {
    final String value = _storyController.text;
    final int start = _storyController.selection.start;
    final int end = _storyController.selection.end;
    final String selectedText = value.substring(start, end);
    final String newText = value.replaceRange(start, end, '*$selectedText*');
    _storyController.text = newText;
  }

  void _underlineText() {
    final String value = _storyController.text;
    final int start = _storyController.selection.start;
    final int end = _storyController.selection.end;
    final String selectedText = value.substring(start, end);
    final String newText =
        value.replaceRange(start, end, '<u>$selectedText</u>');
    _storyController.text = newText;
  }

  void _alignLeft() {
    final String value = _storyController.text;
    final int start = _storyController.selection.start;
    final int end = _storyController.selection.end;
    final String selectedText = value.substring(start, end);
    final String newText =
        value.replaceRange(start, end, '<p align="left">$selectedText</p>');
    _storyController.text = newText;
  }

  void _alignCenter() {
    final String value = _storyController.text;
    final int start = _storyController.selection.start;
    final int end = _storyController.selection.end;
    final String selectedText = value.substring(start, end);
    final String newText =
        value.replaceRange(start, end, '<p align="center">$selectedText</p>');
    _storyController.text = newText;
  }

  void _alignRight() {
    final String value = _storyController.text;
    final int start = _storyController.selection.start;
    final int end = _storyController.selection.end;
    final String selectedText = value.substring(start, end);
    final String newText =
        value.replaceRange(start, end, '<p align="right">$selectedText</p>');
    _storyController.text = newText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsAssets.primary,
      appBar: AppBar(
        backgroundColor: ColorsAssets.primary,
        title: Row(
          children: [
            Text(
              'Write Story',
              style: appBarTitleTextStyle,
            ),
            const SizedBox(width: 8),
            const Icon(
              FluentIcons.edit_20_regular,
              color: ColorsAssets.white,
            ),
          ],
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
                      controller: _titleController,
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
                        controller: _storyController,
                        decoration: InputDecoration(
                          hintText: 'Write your story here...',
                          hintStyle: hintTextStyle,
                          border: InputBorder.none,
                        ),
                        maxLines: null,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: _boldText,
                          icon: const Icon(
                            Icons.format_bold,
                            color: ColorsAssets.white,
                          ),
                        ),
                        IconButton(
                          onPressed: _italicText,
                          icon: const Icon(
                            Icons.format_italic,
                            color: ColorsAssets.white,
                          ),
                        ),
                        IconButton(
                          onPressed: _underlineText,
                          icon: const Icon(
                            Icons.format_underline,
                            color: ColorsAssets.white,
                          ),
                        ),
                        IconButton(
                          onPressed: _alignLeft,
                          icon: const Icon(
                            Icons.format_align_left,
                            color: ColorsAssets.white,
                          ),
                        ),
                        IconButton(
                          onPressed: _alignCenter,
                          icon: const Icon(
                            Icons.format_align_center,
                            color: ColorsAssets.white,
                          ),
                        ),
                        IconButton(
                          onPressed: _alignRight,
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
