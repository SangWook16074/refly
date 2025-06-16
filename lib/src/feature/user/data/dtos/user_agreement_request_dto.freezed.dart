// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_agreement_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserAgreementRequestDto _$UserAgreementRequestDtoFromJson(
    Map<String, dynamic> json) {
  return _UserAgreementRequestDto.fromJson(json);
}

/// @nodoc
mixin _$UserAgreementRequestDto {
  bool get hasconsentedtopolicy => throw _privateConstructorUsedError;
  DateTime get agreedat => throw _privateConstructorUsedError;

  /// Serializes this UserAgreementRequestDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserAgreementRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserAgreementRequestDtoCopyWith<UserAgreementRequestDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAgreementRequestDtoCopyWith<$Res> {
  factory $UserAgreementRequestDtoCopyWith(UserAgreementRequestDto value,
          $Res Function(UserAgreementRequestDto) then) =
      _$UserAgreementRequestDtoCopyWithImpl<$Res, UserAgreementRequestDto>;
  @useResult
  $Res call({bool hasconsentedtopolicy, DateTime agreedat});
}

/// @nodoc
class _$UserAgreementRequestDtoCopyWithImpl<$Res,
        $Val extends UserAgreementRequestDto>
    implements $UserAgreementRequestDtoCopyWith<$Res> {
  _$UserAgreementRequestDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserAgreementRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasconsentedtopolicy = null,
    Object? agreedat = null,
  }) {
    return _then(_value.copyWith(
      hasconsentedtopolicy: null == hasconsentedtopolicy
          ? _value.hasconsentedtopolicy
          : hasconsentedtopolicy // ignore: cast_nullable_to_non_nullable
              as bool,
      agreedat: null == agreedat
          ? _value.agreedat
          : agreedat // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserAgreementRequestDtoImplCopyWith<$Res>
    implements $UserAgreementRequestDtoCopyWith<$Res> {
  factory _$$UserAgreementRequestDtoImplCopyWith(
          _$UserAgreementRequestDtoImpl value,
          $Res Function(_$UserAgreementRequestDtoImpl) then) =
      __$$UserAgreementRequestDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool hasconsentedtopolicy, DateTime agreedat});
}

/// @nodoc
class __$$UserAgreementRequestDtoImplCopyWithImpl<$Res>
    extends _$UserAgreementRequestDtoCopyWithImpl<$Res,
        _$UserAgreementRequestDtoImpl>
    implements _$$UserAgreementRequestDtoImplCopyWith<$Res> {
  __$$UserAgreementRequestDtoImplCopyWithImpl(
      _$UserAgreementRequestDtoImpl _value,
      $Res Function(_$UserAgreementRequestDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserAgreementRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasconsentedtopolicy = null,
    Object? agreedat = null,
  }) {
    return _then(_$UserAgreementRequestDtoImpl(
      hasconsentedtopolicy: null == hasconsentedtopolicy
          ? _value.hasconsentedtopolicy
          : hasconsentedtopolicy // ignore: cast_nullable_to_non_nullable
              as bool,
      agreedat: null == agreedat
          ? _value.agreedat
          : agreedat // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserAgreementRequestDtoImpl implements _UserAgreementRequestDto {
  _$UserAgreementRequestDtoImpl(
      {this.hasconsentedtopolicy = true, required this.agreedat});

  factory _$UserAgreementRequestDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserAgreementRequestDtoImplFromJson(json);

  @override
  @JsonKey()
  final bool hasconsentedtopolicy;
  @override
  final DateTime agreedat;

  @override
  String toString() {
    return 'UserAgreementRequestDto(hasconsentedtopolicy: $hasconsentedtopolicy, agreedat: $agreedat)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserAgreementRequestDtoImpl &&
            (identical(other.hasconsentedtopolicy, hasconsentedtopolicy) ||
                other.hasconsentedtopolicy == hasconsentedtopolicy) &&
            (identical(other.agreedat, agreedat) ||
                other.agreedat == agreedat));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, hasconsentedtopolicy, agreedat);

  /// Create a copy of UserAgreementRequestDto
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

abstract class _UserAgreementRequestDto implements UserAgreementRequestDto {
  factory _UserAgreementRequestDto(
      {final bool hasconsentedtopolicy,
      required final DateTime agreedat}) = _$UserAgreementRequestDtoImpl;

  factory _UserAgreementRequestDto.fromJson(Map<String, dynamic> json) =
      _$UserAgreementRequestDtoImpl.fromJson;

  @override
  bool get hasconsentedtopolicy;
  @override
  DateTime get agreedat;

  /// Create a copy of UserAgreementRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserAgreementRequestDtoImplCopyWith<_$UserAgreementRequestDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
