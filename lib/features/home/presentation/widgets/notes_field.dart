import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/config/app_text_styles.dart';

class NotesField extends StatelessWidget {
  const NotesField({
    required this.controller,
    required this.shade100,
    required this.outlineInputBorder,
    super.key,
  });

  final Color shade100;
  final OutlineInputBorder outlineInputBorder;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Notes", style: AppTextStyles.medium20),
        SizedBox(height: 5.h),
        TextFormField(
          controller: controller,
          maxLines: 5,
          decoration: InputDecoration(
            filled: true,
            fillColor: shade100,
            enabledBorder: outlineInputBorder,
            border: outlineInputBorder,
            hintText: 'Enter notes',
          ),
        ),
      ],
    );
  }
}
