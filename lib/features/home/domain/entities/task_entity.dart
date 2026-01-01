// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:todo_app/core/enums/todo_category.dart' show TodoCategory;
import 'package:todo_app/features/home/data/models/task_model.dart';

class TaskEntity {
  int id;
  String title;
  late TodoCategory category;
  late String date;
  late String time;
  String? notes;
  bool isCompleted;
  TaskEntity({
    required this.title,
    required String date,
    required String time,
    this.id = 0, // Initialize id here
    TodoCategory? category,
    this.notes,
    this.isCompleted = false,
  }) {
    this.category = category ?? TodoCategory.others;
    this.date = date.isEmpty ? "Later" : date;
    this.time = time.isEmpty ? "Later" : time;
  }

  TaskEntity copyWith({
    int? id,
    String? title,
    TodoCategory? category,
    String? date,
    String? time,
    String? notes,
    bool? isCompleted,
  }) {
    return TaskEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      category: category ?? this.category,
      date: date ?? this.date,
      time: time ?? this.time,
      notes: notes ?? this.notes,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

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
