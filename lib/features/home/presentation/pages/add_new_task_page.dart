import 'package:flutter/material.dart';
import 'package:todo_app/core/config/app_color.dart';
import 'package:todo_app/core/utils/app_navigation.dart';
import 'package:todo_app/features/home/presentation/widgets/add_new_task_page_body.dart';

class AddNewTaskPage extends StatelessWidget {
  const AddNewTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            AppNavigation.pop(context);
          },
        ),
        title: const Text(
          "Add New Task",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: AppColor.primary,
      ),
      body: const AddNewTaskPageBody(),
    );
  }
}
