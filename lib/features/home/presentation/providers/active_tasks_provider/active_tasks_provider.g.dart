// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_tasks_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(activeTasks)
final activeTasksProvider = ActiveTasksProvider._();

final class ActiveTasksProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<TaskEntity>>,
          List<TaskEntity>,
          Stream<List<TaskEntity>>
        >
    with $FutureModifier<List<TaskEntity>>, $StreamProvider<List<TaskEntity>> {
  ActiveTasksProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activeTasksProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activeTasksHash();

  @$internal
  @override
  $StreamProviderElement<List<TaskEntity>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<TaskEntity>> create(Ref ref) {
    return activeTasks(ref);
  }
}

String _$activeTasksHash() => r'0334db4c43108b4a8bc42aece7797d2aa0c823d9';
