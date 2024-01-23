// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'part_comments_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PartCommentsModel _$PartCommentsModelFromJson(Map<String, dynamic> json) {
  return _PartCommentsModel.fromJson(json);
}

/// @nodoc
mixin _$PartCommentsModel {
  @JsonKey(name: 'Comments')
  String get comments => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PartCommentsModelCopyWith<PartCommentsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PartCommentsModelCopyWith<$Res> {
  factory $PartCommentsModelCopyWith(
          PartCommentsModel value, $Res Function(PartCommentsModel) then) =
      _$PartCommentsModelCopyWithImpl<$Res, PartCommentsModel>;
  @useResult
  $Res call({@JsonKey(name: 'Comments') String comments});
}

/// @nodoc
class _$PartCommentsModelCopyWithImpl<$Res, $Val extends PartCommentsModel>
    implements $PartCommentsModelCopyWith<$Res> {
  _$PartCommentsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comments = null,
  }) {
    return _then(_value.copyWith(
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PartCommentsModelImplCopyWith<$Res>
    implements $PartCommentsModelCopyWith<$Res> {
  factory _$$PartCommentsModelImplCopyWith(_$PartCommentsModelImpl value,
          $Res Function(_$PartCommentsModelImpl) then) =
      __$$PartCommentsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'Comments') String comments});
}

/// @nodoc
class __$$PartCommentsModelImplCopyWithImpl<$Res>
    extends _$PartCommentsModelCopyWithImpl<$Res, _$PartCommentsModelImpl>
    implements _$$PartCommentsModelImplCopyWith<$Res> {
  __$$PartCommentsModelImplCopyWithImpl(_$PartCommentsModelImpl _value,
      $Res Function(_$PartCommentsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comments = null,
  }) {
    return _then(_$PartCommentsModelImpl(
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PartCommentsModelImpl implements _PartCommentsModel {
  const _$PartCommentsModelImpl(
      {@JsonKey(name: 'Comments') required this.comments});

  factory _$PartCommentsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PartCommentsModelImplFromJson(json);

  @override
  @JsonKey(name: 'Comments')
  final String comments;

  @override
  String toString() {
    return 'PartCommentsModel(comments: $comments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PartCommentsModelImpl &&
            (identical(other.comments, comments) ||
                other.comments == comments));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, comments);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PartCommentsModelImplCopyWith<_$PartCommentsModelImpl> get copyWith =>
      __$$PartCommentsModelImplCopyWithImpl<_$PartCommentsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PartCommentsModelImplToJson(
      this,
    );
  }
}

abstract class _PartCommentsModel implements PartCommentsModel {
  const factory _PartCommentsModel(
          {@JsonKey(name: 'Comments') required final String comments}) =
      _$PartCommentsModelImpl;

  factory _PartCommentsModel.fromJson(Map<String, dynamic> json) =
      _$PartCommentsModelImpl.fromJson;

  @override
  @JsonKey(name: 'Comments')
  String get comments;
  @override
  @JsonKey(ignore: true)
  _$$PartCommentsModelImplCopyWith<_$PartCommentsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
