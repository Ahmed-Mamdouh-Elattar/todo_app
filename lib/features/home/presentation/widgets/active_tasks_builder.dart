import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/config/app_text_styles.dart';
import 'package:todo_app/features/home/domain/entities/task_entity.dart';
import 'package:todo_app/features/home/presentation/providers/active_tasks_provider/active_tasks_provider.dart';
import 'package:todo_app/features/home/presentation/providers/database_operation_provider/database_operation_provider.dart';
import 'package:todo_app/features/home/presentation/widgets/task_Item.dart';
import 'package:todo_app/features/home/presentation/widgets/task_container_list.dart';

class ActiveTasksBuilder extends StatelessWidget {
  const ActiveTasksBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final tasks = ref.watch(activeTasksProvider);
        return tasks.when(
          data: (data) {
            if (data.isEmpty) {
              return TaskContainerList(
                child: SizedBox(
                  width: double.infinity,
                  height: 120.h,
                  child: Center(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "There are no tasks yet",
                        style: AppTextStyles.semiBold20,
                      ),
                    ),
                  ),
                ),
              ).animate().fade();
            } else {
              return TaskContainerList(
                child: Column(
                  children: List.generate(data.length, (index) {
                    final task = data[index];
                    if (index == data.length - 1) {
                      return TaskItem(
                        key: ValueKey(task.id),
                        task: task,
                        isLastTask: true,
                        onDismissed: (direction) => deleteTask(ref, task),
                      );
                    }
                    return TaskItem(
                      key: ValueKey(task.id),
                      task: data[index],
                      onDismissed: (direction) => deleteTask(ref, task),
                    );
                  }),
                ),
              );
            }
          },
          error: (errMessage, stackTrace) {
            return Text("Error: $errMessage");
          },
          loading: () {
            return const Center(child: CircularProgressIndicator());
          },
        );
      },
    );
  }

  void deleteTask(WidgetRef ref, TaskEntity task) {
    ref.read(databaseOperationProvider.notifier).deleteTask(task.id);
  }
}
