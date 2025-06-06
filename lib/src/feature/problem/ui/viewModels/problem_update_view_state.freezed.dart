// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'problem_update_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProblemUpdateViewState {
  ProblemModel get problem => throw _privateConstructorUsedError;

  /// Create a copy of ProblemUpdateViewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProblemUpdateViewStateCopyWith<ProblemUpdateViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProblemUpdateViewStateCopyWith<$Res> {
  factory $ProblemUpdateViewStateCopyWith(ProblemUpdateViewState value,
          $Res Function(ProblemUpdateViewState) then) =
      _$ProblemUpdateViewStateCopyWithImpl<$Res, ProblemUpdateViewState>;
  @useResult
  $Res call({ProblemModel problem});
}

/// @nodoc
class _$ProblemUpdateViewStateCopyWithImpl<$Res,
        $Val extends ProblemUpdateViewState>
    implements $ProblemUpdateViewStateCopyWith<$Res> {
  _$ProblemUpdateViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProblemUpdateViewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? problem = null,
  }) {
    return _then(_value.copyWith(
      problem: null == problem
          ? _value.problem
          : problem // ignore: cast_nullable_to_non_nullable
              as ProblemModel,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProblemUpdateViewStateImplCopyWith<$Res>
    implements $ProblemUpdateViewStateCopyWith<$Res> {
  factory _$$ProblemUpdateViewStateImplCopyWith(
          _$ProblemUpdateViewStateImpl value,
          $Res Function(_$ProblemUpdateViewStateImpl) then) =
      __$$ProblemUpdateViewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ProblemModel problem});
}

/// @nodoc
class __$$ProblemUpdateViewStateImplCopyWithImpl<$Res>
    extends _$ProblemUpdateViewStateCopyWithImpl<$Res,
        _$ProblemUpdateViewStateImpl>
    implements _$$ProblemUpdateViewStateImplCopyWith<$Res> {
  __$$ProblemUpdateViewStateImplCopyWithImpl(
      _$ProblemUpdateViewStateImpl _value,
      $Res Function(_$ProblemUpdateViewStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProblemUpdateViewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? problem = null,
  }) {
    return _then(_$ProblemUpdateViewStateImpl(
      problem: null == problem
          ? _value.problem
          : problem // ignore: cast_nullable_to_non_nullable
              as ProblemModel,
    ));
  }
}

/// @nodoc

class _$ProblemUpdateViewStateImpl extends _ProblemUpdateViewState {
  const _$ProblemUpdateViewStateImpl({required this.problem}) : super._();

  @override
  final ProblemModel problem;

  @override
  String toString() {
    return 'ProblemUpdateViewState(problem: $problem)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProblemUpdateViewStateImpl &&
            (identical(other.problem, problem) || other.problem == problem));
  }

  @override
  int get hashCode => Object.hash(runtimeType, problem);

  /// Create a copy of ProblemUpdateViewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProblemUpdateViewStateImplCopyWith<_$ProblemUpdateViewStateImpl>
      get copyWith => __$$ProblemUpdateViewStateImplCopyWithImpl<
          _$ProblemUpdateViewStateImpl>(this, _$identity);
}

abstract class _ProblemUpdateViewState extends ProblemUpdateViewState {
  const factory _ProblemUpdateViewState({required final ProblemModel problem}) =
      _$ProblemUpdateViewStateImpl;
  const _ProblemUpdateViewState._() : super._();

  @override
  ProblemModel get problem;

  /// Create a copy of ProblemUpdateViewState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProblemUpdateViewStateImplCopyWith<_$ProblemUpdateViewStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
