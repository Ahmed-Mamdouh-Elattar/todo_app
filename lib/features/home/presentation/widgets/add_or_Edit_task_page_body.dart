// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/core/config/app_color.dart';
import 'package:todo_app/core/enums/todo_category.dart';
import 'package:todo_app/core/helper/constants.dart';
import 'package:todo_app/core/helper/show_modal_bottom_sheet_for_success.dart';
import 'package:todo_app/core/utils/app_navigation.dart';
import 'package:todo_app/core/widgets/custom_button.dart';
import 'package:todo_app/features/home/domain/entities/task_entity.dart';
import 'package:todo_app/features/home/presentation/providers/database_operation_provider/database_operation_provider.dart';
import 'package:todo_app/features/home/presentation/providers/database_operation_provider/database_operation_state.dart';
import 'package:todo_app/features/home/presentation/providers/task_entity_provider/task_entity_provider.dart';
import 'package:todo_app/features/home/presentation/widgets/date_and_time_picker.dart';
import 'package:todo_app/features/home/presentation/widgets/notes_field.dart';
import 'package:todo_app/features/home/presentation/widgets/task_category.dart';
import 'package:todo_app/features/home/presentation/widgets/task_title_form_field.dart';

class AddOrEditTaskPageBody extends HookConsumerWidget {
  const AddOrEditTaskPageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final task = ref.watch(taskEntityProvider);
    final categoryController = useValueNotifier<TodoCategory?>(task?.category);
    final dateController = useTextEditingController(text: task?.date);
    final timeController = useTextEditingController(text: task?.time);
    final titleController = useTextEditingController(text: task?.title);
    final notesController = useTextEditingController(text: task?.notes);
    const outlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide(color: AppColor.borderColor),
      borderRadius: BorderRadius.all(Radius.circular(12)),
    );
    final GlobalKey<FormState> formKey = useMemoized(
      () => GlobalKey<FormState>(),
    );

    final shade100 = useMemoized(() => Colors.grey.shade100);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: TaskTitleFormField(
                validator: (taskTitle) {
                  if (taskTitle == null || taskTitle.isEmpty) {
                    return 'Please enter task title';
                  }
                  return null;
                },
                controller: titleController,
                shade100: shade100,
                outlineInputBorder: outlineInputBorder,
              ),
            ),
            const SizedBox(height: 20),
            TaskCategory(categoryController: categoryController),
            const SizedBox(height: 20),
            TimeAndDatePicker(
              dateController: dateController,
              shade100: shade100,
              outlineInputBorder: outlineInputBorder,
              timeController: timeController,
            ),
            const SizedBox(height: 20),
            NotesField(
              controller: notesController,
              shade100: shade100,
              outlineInputBorder: outlineInputBorder,
            ),
            const SizedBox(height: 40),
            Consumer(
              builder: (context, ref, child) {
                ref.listen(databaseOperationProvider, (previous, next) {
                  next.whenOrNull(
                    success: (task) {
                      AppNavigation.pop(context);
                      showModalBottomSheetForSuccess(context, task);
                    },
                  );
                });
                return CustomButton(
                  text: task == null ? "Save" : "Edit",
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      final newTask = TaskEntity(
                        id: task?.id ?? 0,
                        title: titleController.text,
                        category: categoryController.value,
                        date: dateController.text,
                        time: timeController.text,
                        notes: notesController.text,
                        isCompleted: false,
                      );
                      addOrEditTask(ref, task, newTask);
                    }
                  },
                );
              },
            ),
            const SizedBox(height: 30),
          ].animate(interval: 300.ms).fade(duration: 200.ms),
        ),
      ),
    );
  }

  void addOrEditTask(WidgetRef ref, TaskEntity? task, TaskEntity newTask) {
    final databaseOperation = ref.read(databaseOperationProvider.notifier);
    task == null
        ? databaseOperation.updateTask(newTask)
        : databaseOperation.updateTask(newTask);
  }
}
