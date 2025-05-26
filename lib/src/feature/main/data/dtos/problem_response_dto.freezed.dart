// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'problem_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProblemResponseDto _$ProblemResponseDtoFromJson(Map<String, dynamic> json) {
  return _ProblemResponseDto.fromJson(json);
}

/// @nodoc
mixin _$ProblemResponseDto {
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "title")
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: "content")
  String get content => throw _privateConstructorUsedError;
  @JsonKey(name: "is_done")
  bool get isDone => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  DateTime get createAt => throw _privateConstructorUsedError;
  @JsonKey(name: "user_id")
  String get userId => throw _privateConstructorUsedError;

  /// Serializes this ProblemResponseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProblemResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProblemResponseDtoCopyWith<ProblemResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProblemResponseDtoCopyWith<$Res> {
  factory $ProblemResponseDtoCopyWith(
          ProblemResponseDto value, $Res Function(ProblemResponseDto) then) =
      _$ProblemResponseDtoCopyWithImpl<$Res, ProblemResponseDto>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "title") String title,
      @JsonKey(name: "content") String content,
      @JsonKey(name: "is_done") bool isDone,
      @JsonKey(name: "created_at") DateTime createAt,
      @JsonKey(name: "user_id") String userId});
}

/// @nodoc
class _$ProblemResponseDtoCopyWithImpl<$Res, $Val extends ProblemResponseDto>
    implements $ProblemResponseDtoCopyWith<$Res> {
  _$ProblemResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProblemResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? content = null,
    Object? isDone = null,
    Object? createAt = null,
    Object? userId = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      isDone: null == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
      createAt: null == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProblemResponseDtoImplCopyWith<$Res>
    implements $ProblemResponseDtoCopyWith<$Res> {
  factory _$$ProblemResponseDtoImplCopyWith(_$ProblemResponseDtoImpl value,
          $Res Function(_$ProblemResponseDtoImpl) then) =
      __$$ProblemResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "title") String title,
      @JsonKey(name: "content") String content,
      @JsonKey(name: "is_done") bool isDone,
      @JsonKey(name: "created_at") DateTime createAt,
      @JsonKey(name: "user_id") String userId});
}

/// @nodoc
class __$$ProblemResponseDtoImplCopyWithImpl<$Res>
    extends _$ProblemResponseDtoCopyWithImpl<$Res, _$ProblemResponseDtoImpl>
    implements _$$ProblemResponseDtoImplCopyWith<$Res> {
  __$$ProblemResponseDtoImplCopyWithImpl(_$ProblemResponseDtoImpl _value,
      $Res Function(_$ProblemResponseDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProblemResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? content = null,
    Object? isDone = null,
    Object? createAt = null,
    Object? userId = null,
  }) {
    return _then(_$ProblemResponseDtoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      isDone: null == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
      createAt: null == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProblemResponseDtoImpl implements _ProblemResponseDto {
  const _$ProblemResponseDtoImpl(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "title") required this.title,
      @JsonKey(name: "content") this.content = "",
      @JsonKey(name: "is_done") required this.isDone,
      @JsonKey(name: "created_at") required this.createAt,
      @JsonKey(name: "user_id") required this.userId});

  factory _$ProblemResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProblemResponseDtoImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "title")
  final String title;
  @override
  @JsonKey(name: "content")
  final String content;
  @override
  @JsonKey(name: "is_done")
  final bool isDone;
  @override
  @JsonKey(name: "created_at")
  final DateTime createAt;
  @override
  @JsonKey(name: "user_id")
  final String userId;

  @override
  String toString() {
    return 'ProblemResponseDto(id: $id, title: $title, content: $content, isDone: $isDone, createAt: $createAt, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProblemResponseDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.isDone, isDone) || other.isDone == isDone) &&
            (identical(other.createAt, createAt) ||
                other.createAt == createAt) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, content, isDone, createAt, userId);

  /// Create a copy of ProblemResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProblemResponseDtoImplCopyWith<_$ProblemResponseDtoImpl> get copyWith =>
      __$$ProblemResponseDtoImplCopyWithImpl<_$ProblemResponseDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProblemResponseDtoImplToJson(
      this,
    );
  }
}

abstract class _ProblemResponseDto implements ProblemResponseDto {
  const factory _ProblemResponseDto(
          {@JsonKey(name: "id") final int? id,
          @JsonKey(name: "title") required final String title,
          @JsonKey(name: "content") final String content,
          @JsonKey(name: "is_done") required final bool isDone,
          @JsonKey(name: "created_at") required final DateTime createAt,
          @JsonKey(name: "user_id") required final String userId}) =
      _$ProblemResponseDtoImpl;

  factory _ProblemResponseDto.fromJson(Map<String, dynamic> json) =
      _$ProblemResponseDtoImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(name: "title")
  String get title;
  @override
  @JsonKey(name: "content")
  String get content;
  @override
  @JsonKey(name: "is_done")
  bool get isDone;
  @override
  @JsonKey(name: "created_at")
  DateTime get createAt;
  @override
  @JsonKey(name: "user_id")
  String get userId;

  /// Create a copy of ProblemResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProblemResponseDtoImplCopyWith<_$ProblemResponseDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
