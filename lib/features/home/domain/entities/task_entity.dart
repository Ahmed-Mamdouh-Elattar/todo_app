// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:todo_app/core/enums/todo_category.dart' show TodoCategory;
import 'package:todo_app/features/home/data/models/task_model.dart';

class TaskEntity {
  int id;
  String title;
  TodoCategory category;
  String date;
  String time;
  String? notes;
  bool isCompleted;
  TaskEntity({
    required this.title,
    this.id = 0,
    this.category = TodoCategory.others,
    this.date = "Later",
    this.time = "Later",
    this.notes,
    this.isCompleted = false,
  });
  TaskModel toTaskModel() {
    return TaskModel(
      id: id,
      title: title,
      category: category.name,
      date: date,
      time: time,
      notes: notes,
      isCompleted: isCompleted,
    );
  }
}
