// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MainUiState {
  double get snapProgress => throw _privateConstructorUsedError;
  double get userStateOpacity => throw _privateConstructorUsedError;
  double get dateWidgetOpacity => throw _privateConstructorUsedError;

  /// Create a copy of MainUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MainUiStateCopyWith<MainUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainUiStateCopyWith<$Res> {
  factory $MainUiStateCopyWith(
          MainUiState value, $Res Function(MainUiState) then) =
      _$MainUiStateCopyWithImpl<$Res, MainUiState>;
  @useResult
  $Res call(
      {double snapProgress, double userStateOpacity, double dateWidgetOpacity});
}

/// @nodoc
class _$MainUiStateCopyWithImpl<$Res, $Val extends MainUiState>
    implements $MainUiStateCopyWith<$Res> {
  _$MainUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MainUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? snapProgress = null,
    Object? userStateOpacity = null,
    Object? dateWidgetOpacity = null,
  }) {
    return _then(_value.copyWith(
      snapProgress: null == snapProgress
          ? _value.snapProgress
          : snapProgress // ignore: cast_nullable_to_non_nullable
              as double,
      userStateOpacity: null == userStateOpacity
          ? _value.userStateOpacity
          : userStateOpacity // ignore: cast_nullable_to_non_nullable
              as double,
      dateWidgetOpacity: null == dateWidgetOpacity
          ? _value.dateWidgetOpacity
          : dateWidgetOpacity // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MainUIStateImplCopyWith<$Res>
    implements $MainUiStateCopyWith<$Res> {
  factory _$$MainUIStateImplCopyWith(
          _$MainUIStateImpl value, $Res Function(_$MainUIStateImpl) then) =
      __$$MainUIStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double snapProgress, double userStateOpacity, double dateWidgetOpacity});
}

/// @nodoc
class __$$MainUIStateImplCopyWithImpl<$Res>
    extends _$MainUiStateCopyWithImpl<$Res, _$MainUIStateImpl>
    implements _$$MainUIStateImplCopyWith<$Res> {
  __$$MainUIStateImplCopyWithImpl(
      _$MainUIStateImpl _value, $Res Function(_$MainUIStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? snapProgress = null,
    Object? userStateOpacity = null,
    Object? dateWidgetOpacity = null,
  }) {
    return _then(_$MainUIStateImpl(
      snapProgress: null == snapProgress
          ? _value.snapProgress
          : snapProgress // ignore: cast_nullable_to_non_nullable
              as double,
      userStateOpacity: null == userStateOpacity
          ? _value.userStateOpacity
          : userStateOpacity // ignore: cast_nullable_to_non_nullable
              as double,
      dateWidgetOpacity: null == dateWidgetOpacity
          ? _value.dateWidgetOpacity
          : dateWidgetOpacity // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$MainUIStateImpl implements _MainUIState {
  const _$MainUIStateImpl(
      {this.snapProgress = 0.375,
      this.userStateOpacity = 0.0,
      this.dateWidgetOpacity = 1.0});

  @override
  @JsonKey()
  final double snapProgress;
  @override
  @JsonKey()
  final double userStateOpacity;
  @override
  @JsonKey()
  final double dateWidgetOpacity;

  @override
  String toString() {
    return 'MainUiState(snapProgress: $snapProgress, userStateOpacity: $userStateOpacity, dateWidgetOpacity: $dateWidgetOpacity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainUIStateImpl &&
            (identical(other.snapProgress, snapProgress) ||
                other.snapProgress == snapProgress) &&
            (identical(other.userStateOpacity, userStateOpacity) ||
                other.userStateOpacity == userStateOpacity) &&
            (identical(other.dateWidgetOpacity, dateWidgetOpacity) ||
                other.dateWidgetOpacity == dateWidgetOpacity));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, snapProgress, userStateOpacity, dateWidgetOpacity);

  /// Create a copy of MainUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MainUIStateImplCopyWith<_$MainUIStateImpl> get copyWith =>
      __$$MainUIStateImplCopyWithImpl<_$MainUIStateImpl>(this, _$identity);
}

abstract class _MainUIState implements MainUiState {
  const factory _MainUIState(
      {final double snapProgress,
      final double userStateOpacity,
      final double dateWidgetOpacity}) = _$MainUIStateImpl;

  @override
  double get snapProgress;
  @override
  double get userStateOpacity;
  @override
  double get dateWidgetOpacity;

  /// Create a copy of MainUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MainUIStateImplCopyWith<_$MainUIStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
