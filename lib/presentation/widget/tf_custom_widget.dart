import 'package:flutter/material.dart';
import 'package:my_story_app/core/utils/text_style.dart';

class TfCustomWidget extends StatelessWidget {
  const TfCustomWidget({
    super.key,
    required TextEditingController nameController,
    required this.text,
    this.validator,
    required this.height,
    this.inputType,
    this.obscureText,
    this.maxLines,
    this.minLines,
    this.suffixIcon,
  }) : _nameController = nameController;

  final TextEditingController _nameController;
  final String text;
  final String? Function(String?)? validator;
  final double height;
  final TextInputType? inputType;
  final bool? obscureText;
  final int? maxLines;
  final int? minLines;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextFormField(
        style: inputTextStyle,
        controller: _nameController,
        maxLines: maxLines ?? 1,
        minLines: minLines ?? 1,
        keyboardType: inputType,
        obscureText: obscureText ?? false,
        decoration: InputDecoration(
          hintText: text,
          hintStyle: hintTextStyle,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        validator: validator,
      ),
    );
  }
}
