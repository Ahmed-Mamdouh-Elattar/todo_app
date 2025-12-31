import 'package:todo_app/core/services/object_box/object_box.dart';
import 'package:todo_app/core/services/object_box/objectbox.g.dart';
import 'package:todo_app/features/home/data/models/task_model.dart';
import 'package:todo_app/features/home/domain/entities/task_entity.dart';

class DatabaseRepo {
  late final Box<TaskModel> _tasksBox;
  DatabaseRepo(ObjectBox objectBox) {
    _tasksBox = objectBox.store.box<TaskModel>();
  }
  Stream<List<TaskEntity>> getActiveTasks() {
    return _tasksBox
        .query(TaskModel_.isCompleted.equals(false))
        .watch(triggerImmediately: true)
        .map((query) {
          List<TaskModel> tasks = query.find();
          return tasks.map((taskModel) => taskModel.toEntity()).toList();
        });
  }

  Stream<List<TaskEntity>> getCompletedTasks() {
    return _tasksBox
        .query(TaskModel_.isCompleted.equals(true))
        .watch(triggerImmediately: true)
        .map((query) {
          List<TaskModel> tasks = query.find();
          return tasks.map((taskModel) => taskModel.toEntity()).toList();
        });
  }

  void addTask(TaskEntity taskEntity) async {
    TaskModel taskModel = taskEntity.toTaskModel();
    _tasksBox.put(taskModel);
  }

  void updateTask(TaskEntity taskEntity) async {
    TaskModel taskModel = taskEntity.toTaskModel();
    _tasksBox.put(taskModel);
  }

  void deleteTask(int taskId) async {
    _tasksBox.remove(taskId);
  }
}
