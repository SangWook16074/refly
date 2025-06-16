// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_agreement_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserAgreementResponseDto _$UserAgreementResponseDtoFromJson(
    Map<String, dynamic> json) {
  return _UserAgreementRequestDto.fromJson(json);
}

/// @nodoc
mixin _$UserAgreementResponseDto {
  bool get hasconsentedtopolicy => throw _privateConstructorUsedError;

  /// Serializes this UserAgreementResponseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserAgreementResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserAgreementResponseDtoCopyWith<UserAgreementResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAgreementResponseDtoCopyWith<$Res> {
  factory $UserAgreementResponseDtoCopyWith(UserAgreementResponseDto value,
          $Res Function(UserAgreementResponseDto) then) =
      _$UserAgreementResponseDtoCopyWithImpl<$Res, UserAgreementResponseDto>;
  @useResult
  $Res call({bool hasconsentedtopolicy});
}

/// @nodoc
class _$UserAgreementResponseDtoCopyWithImpl<$Res,
        $Val extends UserAgreementResponseDto>
    implements $UserAgreementResponseDtoCopyWith<$Res> {
  _$UserAgreementResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserAgreementResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasconsentedtopolicy = null,
  }) {
    return _then(_value.copyWith(
      hasconsentedtopolicy: null == hasconsentedtopolicy
          ? _value.hasconsentedtopolicy
          : hasconsentedtopolicy // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserAgreementRequestDtoImplCopyWith<$Res>
    implements $UserAgreementResponseDtoCopyWith<$Res> {
  factory _$$UserAgreementRequestDtoImplCopyWith(
          _$UserAgreementRequestDtoImpl value,
          $Res Function(_$UserAgreementRequestDtoImpl) then) =
      __$$UserAgreementRequestDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool hasconsentedtopolicy});
}

/// @nodoc
class __$$UserAgreementRequestDtoImplCopyWithImpl<$Res>
    extends _$UserAgreementResponseDtoCopyWithImpl<$Res,
        _$UserAgreementRequestDtoImpl>
    implements _$$UserAgreementRequestDtoImplCopyWith<$Res> {
  __$$UserAgreementRequestDtoImplCopyWithImpl(
      _$UserAgreementRequestDtoImpl _value,
      $Res Function(_$UserAgreementRequestDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserAgreementResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasconsentedtopolicy = null,
  }) {
    return _then(_$UserAgreementRequestDtoImpl(
      hasconsentedtopolicy: null == hasconsentedtopolicy
          ? _value.hasconsentedtopolicy
          : hasconsentedtopolicy // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserAgreementRequestDtoImpl implements _UserAgreementRequestDto {
  const _$UserAgreementRequestDtoImpl({required this.hasconsentedtopolicy});

  factory _$UserAgreementRequestDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserAgreementRequestDtoImplFromJson(json);

  @override
  final bool hasconsentedtopolicy;

  @override
  String toString() {
    return 'UserAgreementResponseDto(hasconsentedtopolicy: $hasconsentedtopolicy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserAgreementRequestDtoImpl &&
            (identical(other.hasconsentedtopolicy, hasconsentedtopolicy) ||
                other.hasconsentedtopolicy == hasconsentedtopolicy));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, hasconsentedtopolicy);

  /// Create a copy of UserAgreementResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserAgreementRequestDtoImplCopyWith<_$UserAgreementRequestDtoImpl>
      get copyWith => __$$UserAgreementRequestDtoImplCopyWithImpl<
          _$UserAgreementRequestDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserAgreementRequestDtoImplToJson(
      this,
    );
  }
}

abstract class _UserAgreementRequestDto implements UserAgreementResponseDto {
  const factory _UserAgreementRequestDto(
          {required final bool hasconsentedtopolicy}) =
      _$UserAgreementRequestDtoImpl;

  factory _UserAgreementRequestDto.fromJson(Map<String, dynamic> json) =
      _$UserAgreementRequestDtoImpl.fromJson;

  @override
  bool get hasconsentedtopolicy;

  /// Create a copy of UserAgreementResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserAgreementRequestDtoImplCopyWith<_$UserAgreementRequestDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
