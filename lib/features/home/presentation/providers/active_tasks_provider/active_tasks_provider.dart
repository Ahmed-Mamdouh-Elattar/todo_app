import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/features/home/data/repositories/database_repo_providder.dart';
import 'package:todo_app/features/home/domain/entities/task_entity.dart';
part 'active_tasks_provider.g.dart';

@riverpod
Stream<List<TaskEntity>> activeTasks(Ref ref) {
  final databaseRepo = ref.watch(databaseRepoProvider);
  return databaseRepo.getActiveTasks();
}
