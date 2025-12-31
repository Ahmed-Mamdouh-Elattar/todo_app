import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/features/home/data/repositories/database_repo_providder.dart';
import 'package:todo_app/features/home/domain/entities/task_entity.dart';
part 'completed_tasks_provider.g.dart';

@riverpod
Stream<List<TaskEntity>> completedTasks(Ref ref) async* {
  final databaseRepo = ref.watch(databaseRepoProvider);
  await for (final tasks in databaseRepo.getCompletedTasks()) {
    yield tasks;
  }
}
