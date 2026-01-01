import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/core/config/app_color.dart';
import 'package:todo_app/core/utils/app_navigation.dart';
import 'package:todo_app/features/home/presentation/providers/task_entity_provider/task_entity_provider.dart';
import 'package:todo_app/features/home/presentation/widgets/add_or_Edit_task_page_body.dart';

class AddOrEditTaskPage extends ConsumerWidget {
  const AddOrEditTaskPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final task = ref.watch(taskEntityProvider);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            AppNavigation.pop(context);
          },
        ),
        title: Text(
          task == null ? "Add New Task" : "Edit Task",

          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: AppColor.primary,
      ),
      body: const AddOrEditTaskPageBody(),
    );
  }
}
