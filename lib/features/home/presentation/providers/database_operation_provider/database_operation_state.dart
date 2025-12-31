import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_app/features/home/domain/entities/task_entity.dart';
part 'database_operation_state.freezed.dart';

@freezed
sealed class DatabaseOperationState with _$DatabaseOperationState {
  const factory DatabaseOperationState.initial() = DatabaseOperationInitial;
  const factory DatabaseOperationState.success({TaskEntity? task}) =
      DatabaseOperationSuccess;
  const factory DatabaseOperationState.failure(String errorMessage) =
      DatabaseOperationFailure;
}
