// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_stat_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserStatResponseDto _$UserStatResponseDtoFromJson(Map<String, dynamic> json) {
  return _UserStatResponseDto.fromJson(json);
}

/// @nodoc
mixin _$UserStatResponseDto {
  int get total => throw _privateConstructorUsedError;
  int get solve => throw _privateConstructorUsedError;
  int get unsolve => throw _privateConstructorUsedError;

  /// Serializes this UserStatResponseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserStatResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserStatResponseDtoCopyWith<UserStatResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStatResponseDtoCopyWith<$Res> {
  factory $UserStatResponseDtoCopyWith(
          UserStatResponseDto value, $Res Function(UserStatResponseDto) then) =
      _$UserStatResponseDtoCopyWithImpl<$Res, UserStatResponseDto>;
  @useResult
  $Res call({int total, int solve, int unsolve});
}

/// @nodoc
class _$UserStatResponseDtoCopyWithImpl<$Res, $Val extends UserStatResponseDto>
    implements $UserStatResponseDtoCopyWith<$Res> {
  _$UserStatResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserStatResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? solve = null,
    Object? unsolve = null,
  }) {
    return _then(_value.copyWith(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      solve: null == solve
          ? _value.solve
          : solve // ignore: cast_nullable_to_non_nullable
              as int,
      unsolve: null == unsolve
          ? _value.unsolve
          : unsolve // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserStatResponseDtoImplCopyWith<$Res>
    implements $UserStatResponseDtoCopyWith<$Res> {
  factory _$$UserStatResponseDtoImplCopyWith(_$UserStatResponseDtoImpl value,
          $Res Function(_$UserStatResponseDtoImpl) then) =
      __$$UserStatResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int total, int solve, int unsolve});
}

/// @nodoc
class __$$UserStatResponseDtoImplCopyWithImpl<$Res>
    extends _$UserStatResponseDtoCopyWithImpl<$Res, _$UserStatResponseDtoImpl>
    implements _$$UserStatResponseDtoImplCopyWith<$Res> {
  __$$UserStatResponseDtoImplCopyWithImpl(_$UserStatResponseDtoImpl _value,
      $Res Function(_$UserStatResponseDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserStatResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? solve = null,
    Object? unsolve = null,
  }) {
    return _then(_$UserStatResponseDtoImpl(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      solve: null == solve
          ? _value.solve
          : solve // ignore: cast_nullable_to_non_nullable
              as int,
      unsolve: null == unsolve
          ? _value.unsolve
          : unsolve // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserStatResponseDtoImpl implements _UserStatResponseDto {
  const _$UserStatResponseDtoImpl(
      {this.total = 0, this.solve = 0, this.unsolve = 0});

  factory _$UserStatResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserStatResponseDtoImplFromJson(json);

  @override
  @JsonKey()
  final int total;
  @override
  @JsonKey()
  final int solve;
  @override
  @JsonKey()
  final int unsolve;

  @override
  String toString() {
    return 'UserStatResponseDto(total: $total, solve: $solve, unsolve: $unsolve)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserStatResponseDtoImpl &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.solve, solve) || other.solve == solve) &&
            (identical(other.unsolve, unsolve) || other.unsolve == unsolve));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, total, solve, unsolve);

  /// Create a copy of UserStatResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserStatResponseDtoImplCopyWith<_$UserStatResponseDtoImpl> get copyWith =>
      __$$UserStatResponseDtoImplCopyWithImpl<_$UserStatResponseDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserStatResponseDtoImplToJson(
      this,
    );
  }
}

abstract class _UserStatResponseDto implements UserStatResponseDto {
  const factory _UserStatResponseDto(
      {final int total,
      final int solve,
      final int unsolve}) = _$UserStatResponseDtoImpl;

  factory _UserStatResponseDto.fromJson(Map<String, dynamic> json) =
      _$UserStatResponseDtoImpl.fromJson;

  @override
  int get total;
  @override
  int get solve;
  @override
  int get unsolve;

  /// Create a copy of UserStatResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserStatResponseDtoImplCopyWith<_$UserStatResponseDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
