// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:objectbox/objectbox.dart';

@Entity()
class TaskModel {
  @Id()
  int id = 0;
  String title;
  String? category;
  String? date;
  String? time;
  String? notes;
  bool? isCompleted;
  TaskModel({
    required this.title,
    this.category,
    this.date,
    this.time,
    this.notes,
    this.isCompleted,
  });

  @override
  bool operator ==(covariant TaskModel other) {
    if (identical(this, other)) {
      return true;
    }

    return other.id == id &&
        other.title == title &&
        other.category == category &&
        other.date == date &&
        other.time == time &&
        other.notes == notes &&
        other.isCompleted == isCompleted;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        category.hashCode ^
        date.hashCode ^
        time.hashCode ^
        notes.hashCode ^
        isCompleted.hashCode;
  }
}
