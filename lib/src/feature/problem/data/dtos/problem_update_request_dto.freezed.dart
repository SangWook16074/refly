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
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  @JsonKey(name: "is_done")
  bool get isDone => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  DateTime get createAt => throw _privateConstructorUsedError;
  @JsonKey(name: "user_id")
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: "is_favorite")
  bool get isFavorite => throw _privateConstructorUsedError;
  String get solution => throw _privateConstructorUsedError;

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
      {int id,
      String title,
      String content,
      @JsonKey(name: "is_done") bool isDone,
      @JsonKey(name: "created_at") DateTime createAt,
      @JsonKey(name: "user_id") String userId,
      @JsonKey(name: "is_favorite") bool isFavorite,
      String solution});
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
    Object? isFavorite = null,
    Object? solution = null,
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
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      solution: null == solution
          ? _value.solution
          : solution // ignore: cast_nullable_to_non_nullable
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
      {int id,
      String title,
      String content,
      @JsonKey(name: "is_done") bool isDone,
      @JsonKey(name: "created_at") DateTime createAt,
      @JsonKey(name: "user_id") String userId,
      @JsonKey(name: "is_favorite") bool isFavorite,
      String solution});
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
    Object? isFavorite = null,
    Object? solution = null,
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
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      solution: null == solution
          ? _value.solution
          : solution // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProblemUpdateRequestDtoImpl implements _ProblemUpdateRequestDto {
  const _$ProblemUpdateRequestDtoImpl(
      {required this.id,
      required this.title,
      required this.content,
      @JsonKey(name: "is_done") required this.isDone,
      @JsonKey(name: "created_at") required this.createAt,
      @JsonKey(name: "user_id") required this.userId,
      @JsonKey(name: "is_favorite") required this.isFavorite,
      required this.solution});

  factory _$ProblemUpdateRequestDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProblemUpdateRequestDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
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
  @JsonKey(name: "is_favorite")
  final bool isFavorite;
  @override
  final String solution;

  @override
  String toString() {
    return 'ProblemUpdateRequestDto(id: $id, title: $title, content: $content, isDone: $isDone, createAt: $createAt, userId: $userId, isFavorite: $isFavorite, solution: $solution)';
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
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.solution, solution) ||
                other.solution == solution));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, content, isDone,
      createAt, userId, isFavorite, solution);

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
      {required final int id,
      required final String title,
      required final String content,
      @JsonKey(name: "is_done") required final bool isDone,
      @JsonKey(name: "created_at") required final DateTime createAt,
      @JsonKey(name: "user_id") required final String userId,
      @JsonKey(name: "is_favorite") required final bool isFavorite,
      required final String solution}) = _$ProblemUpdateRequestDtoImpl;

  factory _ProblemUpdateRequestDto.fromJson(Map<String, dynamic> json) =
      _$ProblemUpdateRequestDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
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
  @override
  @JsonKey(name: "is_favorite")
  bool get isFavorite;
  @override
  String get solution;

  /// Create a copy of ProblemUpdateRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProblemUpdateRequestDtoImplCopyWith<_$ProblemUpdateRequestDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
