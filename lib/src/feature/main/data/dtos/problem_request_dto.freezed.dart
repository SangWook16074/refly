// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'problem_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProblemRequestDto _$ProblemRequestDtoFromJson(Map<String, dynamic> json) {
  return _ProblemRequestDto.fromJson(json);
}

/// @nodoc
mixin _$ProblemRequestDto {
  @JsonKey(name: "title")
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: "content")
  String get content => throw _privateConstructorUsedError;
  @JsonKey(name: "is_done")
  bool get isDone => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  DateTime get createAt => throw _privateConstructorUsedError;
  @JsonKey(name: "uid")
  String get uid => throw _privateConstructorUsedError;

  /// Serializes this ProblemRequestDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProblemRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProblemRequestDtoCopyWith<ProblemRequestDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProblemRequestDtoCopyWith<$Res> {
  factory $ProblemRequestDtoCopyWith(
          ProblemRequestDto value, $Res Function(ProblemRequestDto) then) =
      _$ProblemRequestDtoCopyWithImpl<$Res, ProblemRequestDto>;
  @useResult
  $Res call(
      {@JsonKey(name: "title") String title,
      @JsonKey(name: "content") String content,
      @JsonKey(name: "is_done") bool isDone,
      @JsonKey(name: "created_at") DateTime createAt,
      @JsonKey(name: "uid") String uid});
}

/// @nodoc
class _$ProblemRequestDtoCopyWithImpl<$Res, $Val extends ProblemRequestDto>
    implements $ProblemRequestDtoCopyWith<$Res> {
  _$ProblemRequestDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProblemRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? content = null,
    Object? isDone = null,
    Object? createAt = null,
    Object? uid = null,
  }) {
    return _then(_value.copyWith(
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
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProblemRequestDtoImplCopyWith<$Res>
    implements $ProblemRequestDtoCopyWith<$Res> {
  factory _$$ProblemRequestDtoImplCopyWith(_$ProblemRequestDtoImpl value,
          $Res Function(_$ProblemRequestDtoImpl) then) =
      __$$ProblemRequestDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "title") String title,
      @JsonKey(name: "content") String content,
      @JsonKey(name: "is_done") bool isDone,
      @JsonKey(name: "created_at") DateTime createAt,
      @JsonKey(name: "uid") String uid});
}

/// @nodoc
class __$$ProblemRequestDtoImplCopyWithImpl<$Res>
    extends _$ProblemRequestDtoCopyWithImpl<$Res, _$ProblemRequestDtoImpl>
    implements _$$ProblemRequestDtoImplCopyWith<$Res> {
  __$$ProblemRequestDtoImplCopyWithImpl(_$ProblemRequestDtoImpl _value,
      $Res Function(_$ProblemRequestDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProblemRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? content = null,
    Object? isDone = null,
    Object? createAt = null,
    Object? uid = null,
  }) {
    return _then(_$ProblemRequestDtoImpl(
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
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProblemRequestDtoImpl implements _ProblemRequestDto {
  const _$ProblemRequestDtoImpl(
      {@JsonKey(name: "title") required this.title,
      @JsonKey(name: "content") required this.content,
      @JsonKey(name: "is_done") required this.isDone,
      @JsonKey(name: "created_at") required this.createAt,
      @JsonKey(name: "uid") required this.uid});

  factory _$ProblemRequestDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProblemRequestDtoImplFromJson(json);

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
  @JsonKey(name: "uid")
  final String uid;

  @override
  String toString() {
    return 'ProblemRequestDto(title: $title, content: $content, isDone: $isDone, createAt: $createAt, uid: $uid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProblemRequestDtoImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.isDone, isDone) || other.isDone == isDone) &&
            (identical(other.createAt, createAt) ||
                other.createAt == createAt) &&
            (identical(other.uid, uid) || other.uid == uid));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, title, content, isDone, createAt, uid);

  /// Create a copy of ProblemRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProblemRequestDtoImplCopyWith<_$ProblemRequestDtoImpl> get copyWith =>
      __$$ProblemRequestDtoImplCopyWithImpl<_$ProblemRequestDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProblemRequestDtoImplToJson(
      this,
    );
  }
}

abstract class _ProblemRequestDto implements ProblemRequestDto {
  const factory _ProblemRequestDto(
          {@JsonKey(name: "title") required final String title,
          @JsonKey(name: "content") required final String content,
          @JsonKey(name: "is_done") required final bool isDone,
          @JsonKey(name: "created_at") required final DateTime createAt,
          @JsonKey(name: "uid") required final String uid}) =
      _$ProblemRequestDtoImpl;

  factory _ProblemRequestDto.fromJson(Map<String, dynamic> json) =
      _$ProblemRequestDtoImpl.fromJson;

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
  @JsonKey(name: "uid")
  String get uid;

  /// Create a copy of ProblemRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProblemRequestDtoImplCopyWith<_$ProblemRequestDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
