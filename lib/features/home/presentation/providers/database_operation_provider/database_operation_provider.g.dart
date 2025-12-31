// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_operation_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DatabaseOperation)
final databaseOperationProvider = DatabaseOperationProvider._();

final class DatabaseOperationProvider
    extends $NotifierProvider<DatabaseOperation, DatabaseOperationState> {
  DatabaseOperationProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'databaseOperationProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$databaseOperationHash();

  @$internal
  @override
  DatabaseOperation create() => DatabaseOperation();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DatabaseOperationState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DatabaseOperationState>(value),
    );
  }
}

String _$databaseOperationHash() => r'9fd447d364806432598c8618f3a106466f4b388d';

abstract class _$DatabaseOperation extends $Notifier<DatabaseOperationState> {
  DatabaseOperationState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<DatabaseOperationState, DatabaseOperationState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<DatabaseOperationState, DatabaseOperationState>,
              DatabaseOperationState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
