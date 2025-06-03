// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_ui_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MainUiEvent {
  double get extent => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double extent) userScrolled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double extent)? userScrolled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double extent)? userScrolled,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_$UserScrolled value) userScrolled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_$UserScrolled value)? userScrolled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_$UserScrolled value)? userScrolled,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of MainUiEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MainUiEventCopyWith<MainUiEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainUiEventCopyWith<$Res> {
  factory $MainUiEventCopyWith(
          MainUiEvent value, $Res Function(MainUiEvent) then) =
      _$MainUiEventCopyWithImpl<$Res, MainUiEvent>;
  @useResult
  $Res call({double extent});
}

/// @nodoc
class _$MainUiEventCopyWithImpl<$Res, $Val extends MainUiEvent>
    implements $MainUiEventCopyWith<$Res> {
  _$MainUiEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MainUiEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? extent = null,
  }) {
    return _then(_value.copyWith(
      extent: null == extent
          ? _value.extent
          : extent // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$$UserScrolledImplCopyWith<$Res>
    implements $MainUiEventCopyWith<$Res> {
  factory _$$$UserScrolledImplCopyWith(
          _$$UserScrolledImpl value, $Res Function(_$$UserScrolledImpl) then) =
      __$$$UserScrolledImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double extent});
}

/// @nodoc
class __$$$UserScrolledImplCopyWithImpl<$Res>
    extends _$MainUiEventCopyWithImpl<$Res, _$$UserScrolledImpl>
    implements _$$$UserScrolledImplCopyWith<$Res> {
  __$$$UserScrolledImplCopyWithImpl(
      _$$UserScrolledImpl _value, $Res Function(_$$UserScrolledImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainUiEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? extent = null,
  }) {
    return _then(_$$UserScrolledImpl(
      extent: null == extent
          ? _value.extent
          : extent // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$$UserScrolledImpl implements _$UserScrolled {
  const _$$UserScrolledImpl({required this.extent});

  @override
  final double extent;

  @override
  String toString() {
    return 'MainUiEvent.userScrolled(extent: $extent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$$UserScrolledImpl &&
            (identical(other.extent, extent) || other.extent == extent));
  }

  @override
  int get hashCode => Object.hash(runtimeType, extent);

  /// Create a copy of MainUiEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$$UserScrolledImplCopyWith<_$$UserScrolledImpl> get copyWith =>
      __$$$UserScrolledImplCopyWithImpl<_$$UserScrolledImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double extent) userScrolled,
  }) {
    return userScrolled(extent);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double extent)? userScrolled,
  }) {
    return userScrolled?.call(extent);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double extent)? userScrolled,
    required TResult orElse(),
  }) {
    if (userScrolled != null) {
      return userScrolled(extent);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_$UserScrolled value) userScrolled,
  }) {
    return userScrolled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_$UserScrolled value)? userScrolled,
  }) {
    return userScrolled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_$UserScrolled value)? userScrolled,
    required TResult orElse(),
  }) {
    if (userScrolled != null) {
      return userScrolled(this);
    }
    return orElse();
  }
}

abstract class _$UserScrolled implements MainUiEvent {
  const factory _$UserScrolled({required final double extent}) =
      _$$UserScrolledImpl;

  @override
  double get extent;

  /// Create a copy of MainUiEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$$UserScrolledImplCopyWith<_$$UserScrolledImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
