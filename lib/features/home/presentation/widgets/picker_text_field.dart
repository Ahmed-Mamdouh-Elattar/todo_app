import 'package:flutter/material.dart';
import 'package:todo_app/core/config/app_text_styles.dart';

class PickerTextField extends StatelessWidget {
  const PickerTextField({
    required this.controller,
    required this.hint,
    required this.title,
    required this.selectTime,
    required this.shade1002,
    required this.outlineInputBorder,
    super.key,
  });

  final Future<Null> Function(BuildContext context) selectTime;
  final Color shade1002;
  final OutlineInputBorder outlineInputBorder;
  final TextEditingController controller;
  final String title;
  final String hint;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.medium20),
        const SizedBox(width: 10),
        TextFormField(
          onTap: () {
            selectTime(context);
          },
          readOnly: true,
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: shade1002,
            enabledBorder: outlineInputBorder,
            border: outlineInputBorder,
            hintText: hint,
          ),
        ),
      ],
    );
  }
}
