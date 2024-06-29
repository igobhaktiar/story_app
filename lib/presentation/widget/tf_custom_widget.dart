import 'package:flutter/material.dart';
import 'package:my_story_app/core/utils/text_style.dart';

class TfCustomWidget extends StatelessWidget {
  const TfCustomWidget({
    super.key,
    required TextEditingController nameController,
    required this.text,
    this.validator, required this.height,
  }) : _nameController = nameController;

  final TextEditingController _nameController;
  final String text;
  final String? Function(String?)? validator;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextFormField(
        style: inputTextStyle,
        controller: _nameController,
        maxLines: 10,
        minLines: 1,

        decoration: InputDecoration(
          hintText: text,
          hintStyle: hintTextStyle,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        validator: validator,
      ),
    );
  }
}
