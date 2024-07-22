import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:my_story_app/core/utils/text_style.dart';
import 'package:intl/intl.dart';
import 'package:my_story_app/data/model/story_model.dart';
import 'package:my_story_app/presentation/story/bloc/story_bloc/story_bloc.dart';
import '../../../core/utils/colors.dart';

class WriteStoryScreen extends StatefulWidget {
  const WriteStoryScreen({super.key});

  @override
  State<WriteStoryScreen> createState() => _WriteStoryScreenState();
}

class _WriteStoryScreenState extends State<WriteStoryScreen> {
  String date = DateFormat('MMMM dd kk:mm').format(DateTime.now());
  final TextEditingController _titleController = TextEditingController();
  final QuillController _storyController = QuillController.basic();

  final FocusNode _focusNode = FocusNode(
    descendantsAreFocusable: true,
    canRequestFocus: true,
  );
  final ScrollController _scrollController = ScrollController(
    keepScrollOffset: true,
  );

  void _publishStory() {
    final title = _titleController.text;
    final story = _storyController.document.toPlainText();

    if (title.isEmpty || story.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Title and story cannot be empty'),
        ),
      );
    } else {
      // Call createStory from StoryUseCase
      context.read<StoryBloc>().add(
            StoryCreateEvent(
              StoryModel(
                title: title,
                story: story,
                comments: [],
              ),
            ),
          );
    }
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
                  color: ColorsAssets.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: ColorsAssets.gunmetal.withOpacity(0.2),
                      blurRadius: 16,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: _titleController,
                      style: inputTitleTextStyle.copyWith(
                        color: ColorsAssets.black,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Story Title...',
                        hintStyle: inputHintTitleTextStyle.copyWith(
                          color: ColorsAssets.grey.withOpacity(0.5),
                        ),
                        focusColor: ColorsAssets.grey,
                        fillColor: ColorsAssets.grey,
                        border: InputBorder.none,
                      ),
                    ),
                    Text(date,
                        style: bodyTextStyle.copyWith(
                          color: ColorsAssets.grey,
                        )),
                    const SizedBox(height: 16),
                    Expanded(
                      child: QuillEditor(
                        configurations: QuillEditorConfigurations(
                          controller: _storyController,
                          placeholder: 'Write your story...',
                        ),
                        focusNode: _focusNode,
                        scrollController: _scrollController,
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: QuillToolbar.simple(
                        configurations: QuillSimpleToolbarConfigurations(
                          controller: _storyController,
                          showBoldButton: true,
                          showItalicButton: true,
                          showUnderLineButton: true,
                          showStrikeThrough: true,
                          showColorButton: false,
                          showBackgroundColorButton: false,
                          showClearFormat: false,
                          showHeaderStyle: true,
                          showRedo: false,
                          showListNumbers: false,
                          showListBullets: false,
                          showCodeBlock: false,
                          showQuote: false,
                          showLink: false,
                          showJustifyAlignment: false,
                          showIndent: false,
                          showClipboardCopy: false,
                          showClipboardCut: false,
                          showClipboardPaste: false,
                          showDirection: false,
                          showFontSize: false,
                          showFontFamily: false,
                          showDividers: false,
                          showInlineCode: false,
                          showSubscript: false,
                          showSuperscript: false,
                          showListCheck: false,
                          showSearchButton: false,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              BlocBuilder<StoryBloc, StoryState>(
                builder: (context, state) {
                  if (state is StoryLoading) {
                    return const CircularProgressIndicator();
                  }
                  return SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _publishStory,
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all(ColorsAssets.secondary),
                        padding: WidgetStateProperty.all(
                          const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 16),
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
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
