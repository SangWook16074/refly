// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_all_problem_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserAllProblemListState {
  List<ProblemModel> get problems => throw _privateConstructorUsedError;

  /// Create a copy of UserAllProblemListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserAllProblemListStateCopyWith<UserAllProblemListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAllProblemListStateCopyWith<$Res> {
  factory $UserAllProblemListStateCopyWith(UserAllProblemListState value,
          $Res Function(UserAllProblemListState) then) =
      _$UserAllProblemListStateCopyWithImpl<$Res, UserAllProblemListState>;
  @useResult
  $Res call({List<ProblemModel> problems});
}

/// @nodoc
class _$UserAllProblemListStateCopyWithImpl<$Res,
        $Val extends UserAllProblemListState>
    implements $UserAllProblemListStateCopyWith<$Res> {
  _$UserAllProblemListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserAllProblemListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? problems = null,
  }) {
    return _then(_value.copyWith(
      problems: null == problems
          ? _value.problems
          : problems // ignore: cast_nullable_to_non_nullable
              as List<ProblemModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserAllProblemListStateImplCopyWith<$Res>
    implements $UserAllProblemListStateCopyWith<$Res> {
  factory _$$UserAllProblemListStateImplCopyWith(
          _$UserAllProblemListStateImpl value,
          $Res Function(_$UserAllProblemListStateImpl) then) =
      __$$UserAllProblemListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ProblemModel> problems});
}

/// @nodoc
class __$$UserAllProblemListStateImplCopyWithImpl<$Res>
    extends _$UserAllProblemListStateCopyWithImpl<$Res,
        _$UserAllProblemListStateImpl>
    implements _$$UserAllProblemListStateImplCopyWith<$Res> {
  __$$UserAllProblemListStateImplCopyWithImpl(
      _$UserAllProblemListStateImpl _value,
      $Res Function(_$UserAllProblemListStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserAllProblemListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? problems = null,
  }) {
    return _then(_$UserAllProblemListStateImpl(
      problems: null == problems
          ? _value._problems
          : problems // ignore: cast_nullable_to_non_nullable
              as List<ProblemModel>,
    ));
  }
}

/// @nodoc

class _$UserAllProblemListStateImpl implements _UserAllProblemListState {
  const _$UserAllProblemListStateImpl(
      {required final List<ProblemModel> problems})
      : _problems = problems;

  final List<ProblemModel> _problems;
  @override
  List<ProblemModel> get problems {
    if (_problems is EqualUnmodifiableListView) return _problems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_problems);
  }

  @override
  String toString() {
    return 'UserAllProblemListState(problems: $problems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserAllProblemListStateImpl &&
            const DeepCollectionEquality().equals(other._problems, _problems));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_problems));

  /// Create a copy of UserAllProblemListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserAllProblemListStateImplCopyWith<_$UserAllProblemListStateImpl>
      get copyWith => __$$UserAllProblemListStateImplCopyWithImpl<
          _$UserAllProblemListStateImpl>(this, _$identity);
}

abstract class _UserAllProblemListState implements UserAllProblemListState {
  const factory _UserAllProblemListState(
          {required final List<ProblemModel> problems}) =
      _$UserAllProblemListStateImpl;

  @override
  List<ProblemModel> get problems;

  /// Create a copy of UserAllProblemListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserAllProblemListStateImplCopyWith<_$UserAllProblemListStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
