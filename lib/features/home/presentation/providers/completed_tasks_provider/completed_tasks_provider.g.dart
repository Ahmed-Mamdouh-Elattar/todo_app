// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completed_tasks_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(completedTasks)
final completedTasksProvider = CompletedTasksProvider._();

final class CompletedTasksProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<TaskEntity>>,
          List<TaskEntity>,
          Stream<List<TaskEntity>>
        >
    with $FutureModifier<List<TaskEntity>>, $StreamProvider<List<TaskEntity>> {
  CompletedTasksProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'completedTasksProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$completedTasksHash();

  @$internal
  @override
  $StreamProviderElement<List<TaskEntity>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<TaskEntity>> create(Ref ref) {
    return completedTasks(ref);
  }
}

String _$completedTasksHash() => r'a3ea198c0feef0063376bc77e8dd6083454cc7d0';
