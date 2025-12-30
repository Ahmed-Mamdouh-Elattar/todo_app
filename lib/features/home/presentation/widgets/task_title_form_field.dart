import 'package:flutter/material.dart';
import 'package:todo_app/core/config/app_text_styles.dart';

class TaskTitleFormField extends StatelessWidget {
  const TaskTitleFormField({
    required this.controller,
    required this.shade100,
    required this.outlineInputBorder,
    super.key,
    this.validator,
  });

  final Color shade100;
  final OutlineInputBorder outlineInputBorder;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Task Title", style: AppTextStyles.medium20),
        const SizedBox(height: 5),
        TextFormField(
          validator: validator,
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: shade100,
            enabledBorder: outlineInputBorder,
            border: outlineInputBorder,
            hintText: 'Enter task title',
          ),
        ),
      ],
    );
  }
}
