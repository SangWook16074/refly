// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'problem_update_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProblemUpdateRequestDto _$ProblemUpdateRequestDtoFromJson(
    Map<String, dynamic> json) {
  return _ProblemUpdateRequestDto.fromJson(json);
}

/// @nodoc
mixin _$ProblemUpdateRequestDto {
  @JsonKey(name: "id")
  int get id => throw _privateConstructorUsedError;
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

  /// Serializes this ProblemUpdateRequestDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProblemUpdateRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProblemUpdateRequestDtoCopyWith<ProblemUpdateRequestDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProblemUpdateRequestDtoCopyWith<$Res> {
  factory $ProblemUpdateRequestDtoCopyWith(ProblemUpdateRequestDto value,
          $Res Function(ProblemUpdateRequestDto) then) =
      _$ProblemUpdateRequestDtoCopyWithImpl<$Res, ProblemUpdateRequestDto>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "title") String title,
      @JsonKey(name: "content") String content,
      @JsonKey(name: "is_done") bool isDone,
      @JsonKey(name: "created_at") DateTime createAt,
      @JsonKey(name: "user_id") String userId});
}

/// @nodoc
class _$ProblemUpdateRequestDtoCopyWithImpl<$Res,
        $Val extends ProblemUpdateRequestDto>
    implements $ProblemUpdateRequestDtoCopyWith<$Res> {
  _$ProblemUpdateRequestDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProblemUpdateRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? isDone = null,
    Object? createAt = null,
    Object? userId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$$ProblemUpdateRequestDtoImplCopyWith<$Res>
    implements $ProblemUpdateRequestDtoCopyWith<$Res> {
  factory _$$ProblemUpdateRequestDtoImplCopyWith(
          _$ProblemUpdateRequestDtoImpl value,
          $Res Function(_$ProblemUpdateRequestDtoImpl) then) =
      __$$ProblemUpdateRequestDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "title") String title,
      @JsonKey(name: "content") String content,
      @JsonKey(name: "is_done") bool isDone,
      @JsonKey(name: "created_at") DateTime createAt,
      @JsonKey(name: "user_id") String userId});
}

/// @nodoc
class __$$ProblemUpdateRequestDtoImplCopyWithImpl<$Res>
    extends _$ProblemUpdateRequestDtoCopyWithImpl<$Res,
        _$ProblemUpdateRequestDtoImpl>
    implements _$$ProblemUpdateRequestDtoImplCopyWith<$Res> {
  __$$ProblemUpdateRequestDtoImplCopyWithImpl(
      _$ProblemUpdateRequestDtoImpl _value,
      $Res Function(_$ProblemUpdateRequestDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProblemUpdateRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? isDone = null,
    Object? createAt = null,
    Object? userId = null,
  }) {
    return _then(_$ProblemUpdateRequestDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
class _$ProblemUpdateRequestDtoImpl implements _ProblemUpdateRequestDto {
  const _$ProblemUpdateRequestDtoImpl(
      {@JsonKey(name: "id") required this.id,
      @JsonKey(name: "title") required this.title,
      @JsonKey(name: "content") required this.content,
      @JsonKey(name: "is_done") required this.isDone,
      @JsonKey(name: "created_at") required this.createAt,
      @JsonKey(name: "user_id") required this.userId});

  factory _$ProblemUpdateRequestDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProblemUpdateRequestDtoImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int id;
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
    return 'ProblemUpdateRequestDto(id: $id, title: $title, content: $content, isDone: $isDone, createAt: $createAt, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProblemUpdateRequestDtoImpl &&
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

  /// Create a copy of ProblemUpdateRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProblemUpdateRequestDtoImplCopyWith<_$ProblemUpdateRequestDtoImpl>
      get copyWith => __$$ProblemUpdateRequestDtoImplCopyWithImpl<
          _$ProblemUpdateRequestDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProblemUpdateRequestDtoImplToJson(
      this,
    );
  }
}

abstract class _ProblemUpdateRequestDto implements ProblemUpdateRequestDto {
  const factory _ProblemUpdateRequestDto(
          {@JsonKey(name: "id") required final int id,
          @JsonKey(name: "title") required final String title,
          @JsonKey(name: "content") required final String content,
          @JsonKey(name: "is_done") required final bool isDone,
          @JsonKey(name: "created_at") required final DateTime createAt,
          @JsonKey(name: "user_id") required final String userId}) =
      _$ProblemUpdateRequestDtoImpl;

  factory _ProblemUpdateRequestDto.fromJson(Map<String, dynamic> json) =
      _$ProblemUpdateRequestDtoImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int get id;
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

  /// Create a copy of ProblemUpdateRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProblemUpdateRequestDtoImplCopyWith<_$ProblemUpdateRequestDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
