import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:todo_app/core/config/app_color.dart';
import 'package:todo_app/core/enums/todo_category.dart';
import 'package:todo_app/core/helper/constants.dart';
import 'package:todo_app/core/widgets/custom_button.dart';
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
            CustomButton(
              text: "Save",
              onPressed: () {
                if (formKey.currentState!.validate()) {}
              },
            ),
            const SizedBox(height: 30),
          ].animate(interval: 300.ms).fade(duration: 200.ms),
        ),
      ),
    );
  }
}
