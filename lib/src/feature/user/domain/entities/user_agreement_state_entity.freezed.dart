// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_agreement_state_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserAgreementStateEntity {
  bool get hasconsentedtopolicy => throw _privateConstructorUsedError;

  /// Create a copy of UserAgreementStateEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserAgreementStateEntityCopyWith<UserAgreementStateEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAgreementStateEntityCopyWith<$Res> {
  factory $UserAgreementStateEntityCopyWith(UserAgreementStateEntity value,
          $Res Function(UserAgreementStateEntity) then) =
      _$UserAgreementStateEntityCopyWithImpl<$Res, UserAgreementStateEntity>;
  @useResult
  $Res call({bool hasconsentedtopolicy});
}

/// @nodoc
class _$UserAgreementStateEntityCopyWithImpl<$Res,
        $Val extends UserAgreementStateEntity>
    implements $UserAgreementStateEntityCopyWith<$Res> {
  _$UserAgreementStateEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserAgreementStateEntity
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
    implements $UserAgreementStateEntityCopyWith<$Res> {
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
    extends _$UserAgreementStateEntityCopyWithImpl<$Res,
        _$UserAgreementRequestDtoImpl>
    implements _$$UserAgreementRequestDtoImplCopyWith<$Res> {
  __$$UserAgreementRequestDtoImplCopyWithImpl(
      _$UserAgreementRequestDtoImpl _value,
      $Res Function(_$UserAgreementRequestDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserAgreementStateEntity
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

class _$UserAgreementRequestDtoImpl extends _UserAgreementRequestDto {
  const _$UserAgreementRequestDtoImpl({required this.hasconsentedtopolicy})
      : super._();

  @override
  final bool hasconsentedtopolicy;

  @override
  String toString() {
    return 'UserAgreementStateEntity(hasconsentedtopolicy: $hasconsentedtopolicy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserAgreementRequestDtoImpl &&
            (identical(other.hasconsentedtopolicy, hasconsentedtopolicy) ||
                other.hasconsentedtopolicy == hasconsentedtopolicy));
  }

  @override
  int get hashCode => Object.hash(runtimeType, hasconsentedtopolicy);

  /// Create a copy of UserAgreementStateEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserAgreementRequestDtoImplCopyWith<_$UserAgreementRequestDtoImpl>
      get copyWith => __$$UserAgreementRequestDtoImplCopyWithImpl<
          _$UserAgreementRequestDtoImpl>(this, _$identity);
}

abstract class _UserAgreementRequestDto extends UserAgreementStateEntity {
  const factory _UserAgreementRequestDto(
          {required final bool hasconsentedtopolicy}) =
      _$UserAgreementRequestDtoImpl;
  const _UserAgreementRequestDto._() : super._();

  @override
  bool get hasconsentedtopolicy;

  /// Create a copy of UserAgreementStateEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserAgreementRequestDtoImplCopyWith<_$UserAgreementRequestDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
