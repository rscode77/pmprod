// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'realize_part_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RealizePartRequest _$RealizePartRequestFromJson(Map<String, dynamic> json) {
  return _RealizePartRequest.fromJson(json);
}

/// @nodoc
mixin _$RealizePartRequest {
  String get partUniqueId => throw _privateConstructorUsedError;
  String get quantity => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RealizePartRequestCopyWith<RealizePartRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RealizePartRequestCopyWith<$Res> {
  factory $RealizePartRequestCopyWith(
          RealizePartRequest value, $Res Function(RealizePartRequest) then) =
      _$RealizePartRequestCopyWithImpl<$Res, RealizePartRequest>;
  @useResult
  $Res call({String partUniqueId, String quantity, String username});
}

/// @nodoc
class _$RealizePartRequestCopyWithImpl<$Res, $Val extends RealizePartRequest>
    implements $RealizePartRequestCopyWith<$Res> {
  _$RealizePartRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? partUniqueId = null,
    Object? quantity = null,
    Object? username = null,
  }) {
    return _then(_value.copyWith(
      partUniqueId: null == partUniqueId
          ? _value.partUniqueId
          : partUniqueId // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RealizePartRequestImplCopyWith<$Res>
    implements $RealizePartRequestCopyWith<$Res> {
  factory _$$RealizePartRequestImplCopyWith(_$RealizePartRequestImpl value,
          $Res Function(_$RealizePartRequestImpl) then) =
      __$$RealizePartRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String partUniqueId, String quantity, String username});
}

/// @nodoc
class __$$RealizePartRequestImplCopyWithImpl<$Res>
    extends _$RealizePartRequestCopyWithImpl<$Res, _$RealizePartRequestImpl>
    implements _$$RealizePartRequestImplCopyWith<$Res> {
  __$$RealizePartRequestImplCopyWithImpl(_$RealizePartRequestImpl _value,
      $Res Function(_$RealizePartRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? partUniqueId = null,
    Object? quantity = null,
    Object? username = null,
  }) {
    return _then(_$RealizePartRequestImpl(
      partUniqueId: null == partUniqueId
          ? _value.partUniqueId
          : partUniqueId // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RealizePartRequestImpl implements _RealizePartRequest {
  const _$RealizePartRequestImpl(
      {required this.partUniqueId,
      required this.quantity,
      required this.username});

  factory _$RealizePartRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$RealizePartRequestImplFromJson(json);

  @override
  final String partUniqueId;
  @override
  final String quantity;
  @override
  final String username;

  @override
  String toString() {
    return 'RealizePartRequest(partUniqueId: $partUniqueId, quantity: $quantity, username: $username)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RealizePartRequestImpl &&
            (identical(other.partUniqueId, partUniqueId) ||
                other.partUniqueId == partUniqueId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, partUniqueId, quantity, username);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RealizePartRequestImplCopyWith<_$RealizePartRequestImpl> get copyWith =>
      __$$RealizePartRequestImplCopyWithImpl<_$RealizePartRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RealizePartRequestImplToJson(
      this,
    );
  }
}

abstract class _RealizePartRequest implements RealizePartRequest {
  const factory _RealizePartRequest(
      {required final String partUniqueId,
      required final String quantity,
      required final String username}) = _$RealizePartRequestImpl;

  factory _RealizePartRequest.fromJson(Map<String, dynamic> json) =
      _$RealizePartRequestImpl.fromJson;

  @override
  String get partUniqueId;
  @override
  String get quantity;
  @override
  String get username;
  @override
  @JsonKey(ignore: true)
  _$$RealizePartRequestImplCopyWith<_$RealizePartRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
