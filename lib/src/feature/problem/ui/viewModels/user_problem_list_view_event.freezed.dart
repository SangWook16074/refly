// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_problem_list_view_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserProblemListViewEvent {
  int get id => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) delete,
    required TResult Function(int id) update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? delete,
    TResult? Function(int id)? update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? delete,
    TResult Function(int id)? update,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DeleteButtonTap value) delete,
    required TResult Function(_UpdateButtonTap value) update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DeleteButtonTap value)? delete,
    TResult? Function(_UpdateButtonTap value)? update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DeleteButtonTap value)? delete,
    TResult Function(_UpdateButtonTap value)? update,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of UserProblemListViewEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserProblemListViewEventCopyWith<UserProblemListViewEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProblemListViewEventCopyWith<$Res> {
  factory $UserProblemListViewEventCopyWith(UserProblemListViewEvent value,
          $Res Function(UserProblemListViewEvent) then) =
      _$UserProblemListViewEventCopyWithImpl<$Res, UserProblemListViewEvent>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$UserProblemListViewEventCopyWithImpl<$Res,
        $Val extends UserProblemListViewEvent>
    implements $UserProblemListViewEventCopyWith<$Res> {
  _$UserProblemListViewEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserProblemListViewEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeleteButtonTapImplCopyWith<$Res>
    implements $UserProblemListViewEventCopyWith<$Res> {
  factory _$$DeleteButtonTapImplCopyWith(_$DeleteButtonTapImpl value,
          $Res Function(_$DeleteButtonTapImpl) then) =
      __$$DeleteButtonTapImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$DeleteButtonTapImplCopyWithImpl<$Res>
    extends _$UserProblemListViewEventCopyWithImpl<$Res, _$DeleteButtonTapImpl>
    implements _$$DeleteButtonTapImplCopyWith<$Res> {
  __$$DeleteButtonTapImplCopyWithImpl(
      _$DeleteButtonTapImpl _value, $Res Function(_$DeleteButtonTapImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserProblemListViewEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$DeleteButtonTapImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DeleteButtonTapImpl implements _DeleteButtonTap {
  const _$DeleteButtonTapImpl({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'UserProblemListViewEvent.delete(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteButtonTapImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of UserProblemListViewEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteButtonTapImplCopyWith<_$DeleteButtonTapImpl> get copyWith =>
      __$$DeleteButtonTapImplCopyWithImpl<_$DeleteButtonTapImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) delete,
    required TResult Function(int id) update,
  }) {
    return delete(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? delete,
    TResult? Function(int id)? update,
  }) {
    return delete?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? delete,
    TResult Function(int id)? update,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DeleteButtonTap value) delete,
    required TResult Function(_UpdateButtonTap value) update,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DeleteButtonTap value)? delete,
    TResult? Function(_UpdateButtonTap value)? update,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DeleteButtonTap value)? delete,
    TResult Function(_UpdateButtonTap value)? update,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class _DeleteButtonTap implements UserProblemListViewEvent {
  const factory _DeleteButtonTap({required final int id}) =
      _$DeleteButtonTapImpl;

  @override
  int get id;

  /// Create a copy of UserProblemListViewEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteButtonTapImplCopyWith<_$DeleteButtonTapImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateButtonTapImplCopyWith<$Res>
    implements $UserProblemListViewEventCopyWith<$Res> {
  factory _$$UpdateButtonTapImplCopyWith(_$UpdateButtonTapImpl value,
          $Res Function(_$UpdateButtonTapImpl) then) =
      __$$UpdateButtonTapImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$UpdateButtonTapImplCopyWithImpl<$Res>
    extends _$UserProblemListViewEventCopyWithImpl<$Res, _$UpdateButtonTapImpl>
    implements _$$UpdateButtonTapImplCopyWith<$Res> {
  __$$UpdateButtonTapImplCopyWithImpl(
      _$UpdateButtonTapImpl _value, $Res Function(_$UpdateButtonTapImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserProblemListViewEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$UpdateButtonTapImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$UpdateButtonTapImpl implements _UpdateButtonTap {
  const _$UpdateButtonTapImpl({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'UserProblemListViewEvent.update(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateButtonTapImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of UserProblemListViewEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateButtonTapImplCopyWith<_$UpdateButtonTapImpl> get copyWith =>
      __$$UpdateButtonTapImplCopyWithImpl<_$UpdateButtonTapImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) delete,
    required TResult Function(int id) update,
  }) {
    return update(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? delete,
    TResult? Function(int id)? update,
  }) {
    return update?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? delete,
    TResult Function(int id)? update,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DeleteButtonTap value) delete,
    required TResult Function(_UpdateButtonTap value) update,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DeleteButtonTap value)? delete,
    TResult? Function(_UpdateButtonTap value)? update,
  }) {
    return update?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DeleteButtonTap value)? delete,
    TResult Function(_UpdateButtonTap value)? update,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class _UpdateButtonTap implements UserProblemListViewEvent {
  const factory _UpdateButtonTap({required final int id}) =
      _$UpdateButtonTapImpl;

  @override
  int get id;

  /// Create a copy of UserProblemListViewEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateButtonTapImplCopyWith<_$UpdateButtonTapImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
