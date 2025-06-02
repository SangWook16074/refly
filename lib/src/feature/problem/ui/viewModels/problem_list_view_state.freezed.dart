// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'problem_list_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProblemListViewState {
  int get selectIndex => throw _privateConstructorUsedError;
  ProblemModel? get problem => throw _privateConstructorUsedError;
  bool get showSheet => throw _privateConstructorUsedError;

  /// Create a copy of ProblemListViewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProblemListViewStateCopyWith<ProblemListViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProblemListViewStateCopyWith<$Res> {
  factory $ProblemListViewStateCopyWith(ProblemListViewState value,
          $Res Function(ProblemListViewState) then) =
      _$ProblemListViewStateCopyWithImpl<$Res, ProblemListViewState>;
  @useResult
  $Res call({int selectIndex, ProblemModel? problem, bool showSheet});
}

/// @nodoc
class _$ProblemListViewStateCopyWithImpl<$Res,
        $Val extends ProblemListViewState>
    implements $ProblemListViewStateCopyWith<$Res> {
  _$ProblemListViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProblemListViewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectIndex = null,
    Object? problem = freezed,
    Object? showSheet = null,
  }) {
    return _then(_value.copyWith(
      selectIndex: null == selectIndex
          ? _value.selectIndex
          : selectIndex // ignore: cast_nullable_to_non_nullable
              as int,
      problem: freezed == problem
          ? _value.problem
          : problem // ignore: cast_nullable_to_non_nullable
              as ProblemModel?,
      showSheet: null == showSheet
          ? _value.showSheet
          : showSheet // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProblemListViewStateImplCopyWith<$Res>
    implements $ProblemListViewStateCopyWith<$Res> {
  factory _$$ProblemListViewStateImplCopyWith(_$ProblemListViewStateImpl value,
          $Res Function(_$ProblemListViewStateImpl) then) =
      __$$ProblemListViewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int selectIndex, ProblemModel? problem, bool showSheet});
}

/// @nodoc
class __$$ProblemListViewStateImplCopyWithImpl<$Res>
    extends _$ProblemListViewStateCopyWithImpl<$Res, _$ProblemListViewStateImpl>
    implements _$$ProblemListViewStateImplCopyWith<$Res> {
  __$$ProblemListViewStateImplCopyWithImpl(_$ProblemListViewStateImpl _value,
      $Res Function(_$ProblemListViewStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProblemListViewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectIndex = null,
    Object? problem = freezed,
    Object? showSheet = null,
  }) {
    return _then(_$ProblemListViewStateImpl(
      selectIndex: null == selectIndex
          ? _value.selectIndex
          : selectIndex // ignore: cast_nullable_to_non_nullable
              as int,
      problem: freezed == problem
          ? _value.problem
          : problem // ignore: cast_nullable_to_non_nullable
              as ProblemModel?,
      showSheet: null == showSheet
          ? _value.showSheet
          : showSheet // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ProblemListViewStateImpl implements _ProblemListViewState {
  const _$ProblemListViewStateImpl(
      {this.selectIndex = -1, this.problem = null, this.showSheet = false});

  @override
  @JsonKey()
  final int selectIndex;
  @override
  @JsonKey()
  final ProblemModel? problem;
  @override
  @JsonKey()
  final bool showSheet;

  @override
  String toString() {
    return 'ProblemListViewState(selectIndex: $selectIndex, problem: $problem, showSheet: $showSheet)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProblemListViewStateImpl &&
            (identical(other.selectIndex, selectIndex) ||
                other.selectIndex == selectIndex) &&
            (identical(other.problem, problem) || other.problem == problem) &&
            (identical(other.showSheet, showSheet) ||
                other.showSheet == showSheet));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectIndex, problem, showSheet);

  /// Create a copy of ProblemListViewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProblemListViewStateImplCopyWith<_$ProblemListViewStateImpl>
      get copyWith =>
          __$$ProblemListViewStateImplCopyWithImpl<_$ProblemListViewStateImpl>(
              this, _$identity);
}

abstract class _ProblemListViewState implements ProblemListViewState {
  const factory _ProblemListViewState(
      {final int selectIndex,
      final ProblemModel? problem,
      final bool showSheet}) = _$ProblemListViewStateImpl;

  @override
  int get selectIndex;
  @override
  ProblemModel? get problem;
  @override
  bool get showSheet;

  /// Create a copy of ProblemListViewState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProblemListViewStateImplCopyWith<_$ProblemListViewStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
