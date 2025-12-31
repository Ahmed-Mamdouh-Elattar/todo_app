import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/core/services/object_box/object_box_provider.dart';
import 'package:todo_app/features/home/data/repositories/database_repo.dart';

final databaseRepoProvider = Provider<DatabaseRepo>((ref) {
  final objectBox = ref.watch(objectBoxProvider);
  return DatabaseRepo(objectBox);
});
