// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_part_operations_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetPartOperatinsRequest _$GetPartOperatinsRequestFromJson(
    Map<String, dynamic> json) {
  return _GetPartOperatinsRequest.fromJson(json);
}

/// @nodoc
mixin _$GetPartOperatinsRequest {
  String get partSymbol => throw _privateConstructorUsedError;
  String get mainOrder => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetPartOperatinsRequestCopyWith<GetPartOperatinsRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetPartOperatinsRequestCopyWith<$Res> {
  factory $GetPartOperatinsRequestCopyWith(GetPartOperatinsRequest value,
          $Res Function(GetPartOperatinsRequest) then) =
      _$GetPartOperatinsRequestCopyWithImpl<$Res, GetPartOperatinsRequest>;
  @useResult
  $Res call({String partSymbol, String mainOrder});
}

/// @nodoc
class _$GetPartOperatinsRequestCopyWithImpl<$Res,
        $Val extends GetPartOperatinsRequest>
    implements $GetPartOperatinsRequestCopyWith<$Res> {
  _$GetPartOperatinsRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? partSymbol = null,
    Object? mainOrder = null,
  }) {
    return _then(_value.copyWith(
      partSymbol: null == partSymbol
          ? _value.partSymbol
          : partSymbol // ignore: cast_nullable_to_non_nullable
              as String,
      mainOrder: null == mainOrder
          ? _value.mainOrder
          : mainOrder // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetPartOperatinsRequestImplCopyWith<$Res>
    implements $GetPartOperatinsRequestCopyWith<$Res> {
  factory _$$GetPartOperatinsRequestImplCopyWith(
          _$GetPartOperatinsRequestImpl value,
          $Res Function(_$GetPartOperatinsRequestImpl) then) =
      __$$GetPartOperatinsRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String partSymbol, String mainOrder});
}

/// @nodoc
class __$$GetPartOperatinsRequestImplCopyWithImpl<$Res>
    extends _$GetPartOperatinsRequestCopyWithImpl<$Res,
        _$GetPartOperatinsRequestImpl>
    implements _$$GetPartOperatinsRequestImplCopyWith<$Res> {
  __$$GetPartOperatinsRequestImplCopyWithImpl(
      _$GetPartOperatinsRequestImpl _value,
      $Res Function(_$GetPartOperatinsRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? partSymbol = null,
    Object? mainOrder = null,
  }) {
    return _then(_$GetPartOperatinsRequestImpl(
      partSymbol: null == partSymbol
          ? _value.partSymbol
          : partSymbol // ignore: cast_nullable_to_non_nullable
              as String,
      mainOrder: null == mainOrder
          ? _value.mainOrder
          : mainOrder // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetPartOperatinsRequestImpl implements _GetPartOperatinsRequest {
  const _$GetPartOperatinsRequestImpl(
      {required this.partSymbol, required this.mainOrder});

  factory _$GetPartOperatinsRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetPartOperatinsRequestImplFromJson(json);

  @override
  final String partSymbol;
  @override
  final String mainOrder;

  @override
  String toString() {
    return 'GetPartOperatinsRequest(partSymbol: $partSymbol, mainOrder: $mainOrder)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetPartOperatinsRequestImpl &&
            (identical(other.partSymbol, partSymbol) ||
                other.partSymbol == partSymbol) &&
            (identical(other.mainOrder, mainOrder) ||
                other.mainOrder == mainOrder));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, partSymbol, mainOrder);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetPartOperatinsRequestImplCopyWith<_$GetPartOperatinsRequestImpl>
      get copyWith => __$$GetPartOperatinsRequestImplCopyWithImpl<
          _$GetPartOperatinsRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetPartOperatinsRequestImplToJson(
      this,
    );
  }
}

abstract class _GetPartOperatinsRequest implements GetPartOperatinsRequest {
  const factory _GetPartOperatinsRequest(
      {required final String partSymbol,
      required final String mainOrder}) = _$GetPartOperatinsRequestImpl;

  factory _GetPartOperatinsRequest.fromJson(Map<String, dynamic> json) =
      _$GetPartOperatinsRequestImpl.fromJson;

  @override
  String get partSymbol;
  @override
  String get mainOrder;
  @override
  @JsonKey(ignore: true)
  _$$GetPartOperatinsRequestImplCopyWith<_$GetPartOperatinsRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
