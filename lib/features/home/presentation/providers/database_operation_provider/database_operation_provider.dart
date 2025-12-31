import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/features/home/data/repositories/database_repo_providder.dart';
import 'package:todo_app/features/home/domain/entities/task_entity.dart';
import 'package:todo_app/features/home/presentation/providers/database_operation_provider/database_operation_state.dart';
part 'database_operation_provider.g.dart';

@riverpod
class DatabaseOperation extends _$DatabaseOperation {
  @override
  DatabaseOperationState build() {
    return const DatabaseOperationState.initial();
  }

  void addTask(TaskEntity taskEntity) {
    try {
      ref.watch(databaseRepoProvider).addTask(taskEntity);
      state = const DatabaseOperationState.success();
    } catch (e) {
      state = const DatabaseOperationState.failure("Failed to add task");
    }
  }

  void updateTask(TaskEntity taskEntity) {
    try {
      ref.watch(databaseRepoProvider).updateTask(taskEntity);
      state = const DatabaseOperationState.success();
    } catch (e) {
      state = const DatabaseOperationState.failure("Failed to update task");
    }
  }

  void deleteTask(int taskId) {
    try {
      ref.watch(databaseRepoProvider).deleteTask(taskId);
      state = const DatabaseOperationState.success();
    } catch (e) {
      state = const DatabaseOperationState.failure("Failed to delete task");
    }
  }
}
