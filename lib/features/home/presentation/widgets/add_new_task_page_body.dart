import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/core/config/app_color.dart';
import 'package:todo_app/core/config/app_text_styles.dart';
import 'package:todo_app/core/enums/todo_category.dart';
import 'package:todo_app/core/helper/constants.dart';
import 'package:todo_app/core/utils/app_navigation.dart';
import 'package:todo_app/core/widgets/custom_button.dart';
import 'package:todo_app/features/home/domain/entities/task_entity.dart';
import 'package:todo_app/features/home/presentation/providers/database_operation_provider/database_operation_provider.dart';
import 'package:todo_app/features/home/presentation/providers/database_operation_provider/database_operation_state.dart';
import 'package:todo_app/features/home/presentation/widgets/date_and_time_picker.dart';
import 'package:todo_app/features/home/presentation/widgets/notes_field.dart';
import 'package:todo_app/features/home/presentation/widgets/task_category.dart';
import 'package:todo_app/features/home/presentation/widgets/task_title_form_field.dart';

class AddNewTaskPageBody extends HookWidget {
  const AddNewTaskPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryController = useValueNotifier<TodoCategory?>(null);
    final dateController = useTextEditingController();
    final timeController = useTextEditingController();
    final titleController = useTextEditingController();
    final notesController = useTextEditingController();
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
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        builder: (context) {
                          return SizedBox(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(height: 20),
                                Text(
                                  task!.title,
                                  style: AppTextStyles.semiBold20,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "Task added successfully✅",
                                  style: AppTextStyles.medium18,
                                ),
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
                    },
                  );
                });
                return CustomButton(
                  text: "Save",
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      final databaseOperation = ref.read(
                        databaseOperationProvider.notifier,
                      );
                      final task = TaskEntity(
                        title: titleController.text,
                        category: categoryController.value,
                        date: dateController.text,
                        time: timeController.text,
                        notes: notesController.text,
                        isCompleted: false,
                      );
                      databaseOperation.addTask(task);
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
}
