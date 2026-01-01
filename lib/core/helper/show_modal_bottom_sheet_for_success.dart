import 'package:flutter/material.dart';
import 'package:todo_app/core/config/app_text_styles.dart';
import 'package:todo_app/features/home/domain/entities/task_entity.dart';

void showModalBottomSheetForSuccess(BuildContext context, TaskEntity? task) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    builder: (context) {
      return SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Text(task!.title, style: AppTextStyles.semiBold20),
            const SizedBox(height: 10),
            Text("Task added successfully✅", style: AppTextStyles.medium18),
            const SizedBox(height: 10),
            Text(
              "Do your best to finish the task🦾",
              style: AppTextStyles.medium18,
            ),
          ],
        ),
      );
    },
  );
}
