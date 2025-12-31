// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'database_operation_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DatabaseOperationState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DatabaseOperationState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DatabaseOperationState()';
}


}

/// @nodoc
class $DatabaseOperationStateCopyWith<$Res>  {
$DatabaseOperationStateCopyWith(DatabaseOperationState _, $Res Function(DatabaseOperationState) __);
}


/// Adds pattern-matching-related methods to [DatabaseOperationState].
extension DatabaseOperationStatePatterns on DatabaseOperationState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DatabaseOperationInitial value)?  initial,TResult Function( DatabaseOperationSuccess value)?  success,TResult Function( DatabaseOperationFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DatabaseOperationInitial() when initial != null:
return initial(_that);case DatabaseOperationSuccess() when success != null:
return success(_that);case DatabaseOperationFailure() when failure != null:
return failure(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DatabaseOperationInitial value)  initial,required TResult Function( DatabaseOperationSuccess value)  success,required TResult Function( DatabaseOperationFailure value)  failure,}){
final _that = this;
switch (_that) {
case DatabaseOperationInitial():
return initial(_that);case DatabaseOperationSuccess():
return success(_that);case DatabaseOperationFailure():
return failure(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DatabaseOperationInitial value)?  initial,TResult? Function( DatabaseOperationSuccess value)?  success,TResult? Function( DatabaseOperationFailure value)?  failure,}){
final _that = this;
switch (_that) {
case DatabaseOperationInitial() when initial != null:
return initial(_that);case DatabaseOperationSuccess() when success != null:
return success(_that);case DatabaseOperationFailure() when failure != null:
return failure(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( TaskEntity? task)?  success,TResult Function( String errorMessage)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DatabaseOperationInitial() when initial != null:
return initial();case DatabaseOperationSuccess() when success != null:
return success(_that.task);case DatabaseOperationFailure() when failure != null:
return failure(_that.errorMessage);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( TaskEntity? task)  success,required TResult Function( String errorMessage)  failure,}) {final _that = this;
switch (_that) {
case DatabaseOperationInitial():
return initial();case DatabaseOperationSuccess():
return success(_that.task);case DatabaseOperationFailure():
return failure(_that.errorMessage);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( TaskEntity? task)?  success,TResult? Function( String errorMessage)?  failure,}) {final _that = this;
switch (_that) {
case DatabaseOperationInitial() when initial != null:
return initial();case DatabaseOperationSuccess() when success != null:
return success(_that.task);case DatabaseOperationFailure() when failure != null:
return failure(_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class DatabaseOperationInitial implements DatabaseOperationState {
  const DatabaseOperationInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DatabaseOperationInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DatabaseOperationState.initial()';
}


}




/// @nodoc


class DatabaseOperationSuccess implements DatabaseOperationState {
  const DatabaseOperationSuccess({this.task});
  

 final  TaskEntity? task;

/// Create a copy of DatabaseOperationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DatabaseOperationSuccessCopyWith<DatabaseOperationSuccess> get copyWith => _$DatabaseOperationSuccessCopyWithImpl<DatabaseOperationSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DatabaseOperationSuccess&&(identical(other.task, task) || other.task == task));
}


@override
int get hashCode => Object.hash(runtimeType,task);

@override
String toString() {
  return 'DatabaseOperationState.success(task: $task)';
}


}

/// @nodoc
abstract mixin class $DatabaseOperationSuccessCopyWith<$Res> implements $DatabaseOperationStateCopyWith<$Res> {
  factory $DatabaseOperationSuccessCopyWith(DatabaseOperationSuccess value, $Res Function(DatabaseOperationSuccess) _then) = _$DatabaseOperationSuccessCopyWithImpl;
@useResult
$Res call({
 TaskEntity? task
});




}
/// @nodoc
class _$DatabaseOperationSuccessCopyWithImpl<$Res>
    implements $DatabaseOperationSuccessCopyWith<$Res> {
  _$DatabaseOperationSuccessCopyWithImpl(this._self, this._then);

  final DatabaseOperationSuccess _self;
  final $Res Function(DatabaseOperationSuccess) _then;

/// Create a copy of DatabaseOperationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? task = freezed,}) {
  return _then(DatabaseOperationSuccess(
task: freezed == task ? _self.task : task // ignore: cast_nullable_to_non_nullable
as TaskEntity?,
  ));
}


}

/// @nodoc


class DatabaseOperationFailure implements DatabaseOperationState {
  const DatabaseOperationFailure(this.errorMessage);
  

 final  String errorMessage;

/// Create a copy of DatabaseOperationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DatabaseOperationFailureCopyWith<DatabaseOperationFailure> get copyWith => _$DatabaseOperationFailureCopyWithImpl<DatabaseOperationFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DatabaseOperationFailure&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage);

@override
String toString() {
  return 'DatabaseOperationState.failure(errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $DatabaseOperationFailureCopyWith<$Res> implements $DatabaseOperationStateCopyWith<$Res> {
  factory $DatabaseOperationFailureCopyWith(DatabaseOperationFailure value, $Res Function(DatabaseOperationFailure) _then) = _$DatabaseOperationFailureCopyWithImpl;
@useResult
$Res call({
 String errorMessage
});




}
/// @nodoc
class _$DatabaseOperationFailureCopyWithImpl<$Res>
    implements $DatabaseOperationFailureCopyWith<$Res> {
  _$DatabaseOperationFailureCopyWithImpl(this._self, this._then);

  final DatabaseOperationFailure _self;
  final $Res Function(DatabaseOperationFailure) _then;

/// Create a copy of DatabaseOperationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,}) {
  return _then(DatabaseOperationFailure(
null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
