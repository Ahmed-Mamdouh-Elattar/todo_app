// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/core/config/app_color.dart';
import 'package:todo_app/core/config/app_text_styles.dart';
import 'package:todo_app/core/utils/app_navigation.dart';
import 'package:todo_app/features/home/domain/entities/task_entity.dart';
import 'package:todo_app/features/home/presentation/pages/add_or_edit_task_page.dart';
import 'package:todo_app/features/home/presentation/providers/task_entity_provider/task_entity_provider.dart';
import 'package:todo_app/features/home/presentation/widgets/category_icon.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    required this.task,
    this.isLastTask = false,
    super.key,
    this.onDismissed,
  });
  final bool isLastTask;
  final TaskEntity task;
  final void Function(DismissDirection)? onDismissed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!task.isCompleted) {
          AppNavigation.pushSharedAxis(
            context,
            ProviderScope(
              overrides: [taskEntityProvider.overrideWithValue(task)],
              child: const AddOrEditTaskPage(),
            ),
          );
        }
      },
      child: Dismissible(
        key: ValueKey(task.id),
        direction: DismissDirection.endToStart,
        background: Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          color: Colors.red,
          child: const Icon(Icons.delete, color: Colors.white),
        ),
        onDismissed: onDismissed,
        child: Column(
          children: [
            Row(
              children: [
                CategoryIcon(
                  color: task.category.color,
                  iconData: task.category.icon,
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.title,
                      style: AppTextStyles.medium16.copyWith(
                        decoration: task.isCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Due: ${task.date}",
                      style: AppTextStyles.regular12.copyWith(
                        color: Colors.grey,
                        decoration: task.isCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Checkbox(
                  activeColor: AppColor.primary,
                  value: task.isCompleted ? true : false,
                  onChanged: (value) {},
                ),
              ],
            ),
            if (!isLastTask) const Divider(height: 30),
          ],
        ),
      ),
    );
  }
}
