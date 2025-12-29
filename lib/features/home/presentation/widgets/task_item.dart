import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/config/app_color.dart';
import 'package:todo_app/core/config/app_text_styles.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    this.isCompleted = false,
    this.isLastTask = false,
    super.key,
  });
  final bool isLastTask;
  final bool isCompleted;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(Icons.home, size: 44.sp),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Buy Groceries",
                  style: AppTextStyles.medium16.copyWith(
                    decoration: isCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Due: Aug 7, 2024",
                  style: AppTextStyles.regular12.copyWith(
                    color: Colors.grey,
                    decoration: isCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Checkbox(
              activeColor: AppColor.primary,
              value: isCompleted ? true : false,
              onChanged: (value) {},
            ),
          ],
        ),
        if (!isLastTask) const Divider(),
      ],
    );
  }
}
