// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authentication_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthenticationModel _$AuthenticationModelFromJson(Map<String, dynamic> json) {
  return _AuthenticationModel.fromJson(json);
}

/// @nodoc
mixin _$AuthenticationModel {
  @JsonKey(name: 'Id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Username')
  String? get userName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthenticationModelCopyWith<AuthenticationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationModelCopyWith<$Res> {
  factory $AuthenticationModelCopyWith(
          AuthenticationModel value, $Res Function(AuthenticationModel) then) =
      _$AuthenticationModelCopyWithImpl<$Res, AuthenticationModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Id') int? id,
      @JsonKey(name: 'Username') String? userName});
}

/// @nodoc
class _$AuthenticationModelCopyWithImpl<$Res, $Val extends AuthenticationModel>
    implements $AuthenticationModelCopyWith<$Res> {
  _$AuthenticationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userName = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthenticationModelImplCopyWith<$Res>
    implements $AuthenticationModelCopyWith<$Res> {
  factory _$$AuthenticationModelImplCopyWith(_$AuthenticationModelImpl value,
          $Res Function(_$AuthenticationModelImpl) then) =
      __$$AuthenticationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Id') int? id,
      @JsonKey(name: 'Username') String? userName});
}

/// @nodoc
class __$$AuthenticationModelImplCopyWithImpl<$Res>
    extends _$AuthenticationModelCopyWithImpl<$Res, _$AuthenticationModelImpl>
    implements _$$AuthenticationModelImplCopyWith<$Res> {
  __$$AuthenticationModelImplCopyWithImpl(_$AuthenticationModelImpl _value,
      $Res Function(_$AuthenticationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userName = freezed,
  }) {
    return _then(_$AuthenticationModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthenticationModelImpl implements _AuthenticationModel {
  const _$AuthenticationModelImpl(
      {@JsonKey(name: 'Id') required this.id,
      @JsonKey(name: 'Username') required this.userName});

  factory _$AuthenticationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthenticationModelImplFromJson(json);

  @override
  @JsonKey(name: 'Id')
  final int? id;
  @override
  @JsonKey(name: 'Username')
  final String? userName;

  @override
  String toString() {
    return 'AuthenticationModel(id: $id, userName: $userName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticationModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userName, userName) ||
                other.userName == userName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenticationModelImplCopyWith<_$AuthenticationModelImpl> get copyWith =>
      __$$AuthenticationModelImplCopyWithImpl<_$AuthenticationModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthenticationModelImplToJson(
      this,
    );
  }
}

abstract class _AuthenticationModel implements AuthenticationModel {
  const factory _AuthenticationModel(
          {@JsonKey(name: 'Id') required final int? id,
          @JsonKey(name: 'Username') required final String? userName}) =
      _$AuthenticationModelImpl;

  factory _AuthenticationModel.fromJson(Map<String, dynamic> json) =
      _$AuthenticationModelImpl.fromJson;

  @override
  @JsonKey(name: 'Id')
  int? get id;
  @override
  @JsonKey(name: 'Username')
  String? get userName;
  @override
  @JsonKey(ignore: true)
  _$$AuthenticationModelImplCopyWith<_$AuthenticationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
