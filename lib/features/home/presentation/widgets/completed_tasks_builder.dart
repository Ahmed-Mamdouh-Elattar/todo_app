import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/config/app_text_styles.dart';
import 'package:todo_app/features/home/presentation/providers/completed_tasks_provider/completed_tasks_provider.dart';
import 'package:todo_app/features/home/presentation/widgets/task_Item.dart';
import 'package:todo_app/features/home/presentation/widgets/task_container_list.dart';

class CompletedTasksBuilder extends StatelessWidget {
  const CompletedTasksBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final tasks = ref.watch(completedTasksProvider);
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
                        "There are no completed tasks yet",
                        style: AppTextStyles.semiBold20,
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return TaskContainerList(
                child: Column(
                  children: List.generate(data.length, (index) {
                    if (index == data.length - 1) {
                      return TaskItem(task: data[index], isLastTask: true);
                    }
                    return TaskItem(task: data[index]);
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
}
