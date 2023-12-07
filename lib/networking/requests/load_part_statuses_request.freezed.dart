// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'load_part_statuses_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoadPartStatusesRequest _$LoadPartStatusesRequestFromJson(
    Map<String, dynamic> json) {
  return _LoadPartStatusesRequest.fromJson(json);
}

/// @nodoc
mixin _$LoadPartStatusesRequest {
  String get mainOrder => throw _privateConstructorUsedError;
  String get partSymbol => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoadPartStatusesRequestCopyWith<LoadPartStatusesRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoadPartStatusesRequestCopyWith<$Res> {
  factory $LoadPartStatusesRequestCopyWith(LoadPartStatusesRequest value,
          $Res Function(LoadPartStatusesRequest) then) =
      _$LoadPartStatusesRequestCopyWithImpl<$Res, LoadPartStatusesRequest>;
  @useResult
  $Res call({String mainOrder, String partSymbol});
}

/// @nodoc
class _$LoadPartStatusesRequestCopyWithImpl<$Res,
        $Val extends LoadPartStatusesRequest>
    implements $LoadPartStatusesRequestCopyWith<$Res> {
  _$LoadPartStatusesRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mainOrder = null,
    Object? partSymbol = null,
  }) {
    return _then(_value.copyWith(
      mainOrder: null == mainOrder
          ? _value.mainOrder
          : mainOrder // ignore: cast_nullable_to_non_nullable
              as String,
      partSymbol: null == partSymbol
          ? _value.partSymbol
          : partSymbol // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoadPartStatusesRequestImplCopyWith<$Res>
    implements $LoadPartStatusesRequestCopyWith<$Res> {
  factory _$$LoadPartStatusesRequestImplCopyWith(
          _$LoadPartStatusesRequestImpl value,
          $Res Function(_$LoadPartStatusesRequestImpl) then) =
      __$$LoadPartStatusesRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String mainOrder, String partSymbol});
}

/// @nodoc
class __$$LoadPartStatusesRequestImplCopyWithImpl<$Res>
    extends _$LoadPartStatusesRequestCopyWithImpl<$Res,
        _$LoadPartStatusesRequestImpl>
    implements _$$LoadPartStatusesRequestImplCopyWith<$Res> {
  __$$LoadPartStatusesRequestImplCopyWithImpl(
      _$LoadPartStatusesRequestImpl _value,
      $Res Function(_$LoadPartStatusesRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mainOrder = null,
    Object? partSymbol = null,
  }) {
    return _then(_$LoadPartStatusesRequestImpl(
      mainOrder: null == mainOrder
          ? _value.mainOrder
          : mainOrder // ignore: cast_nullable_to_non_nullable
              as String,
      partSymbol: null == partSymbol
          ? _value.partSymbol
          : partSymbol // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoadPartStatusesRequestImpl implements _LoadPartStatusesRequest {
  const _$LoadPartStatusesRequestImpl(
      {required this.mainOrder, required this.partSymbol});

  factory _$LoadPartStatusesRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoadPartStatusesRequestImplFromJson(json);

  @override
  final String mainOrder;
  @override
  final String partSymbol;

  @override
  String toString() {
    return 'LoadPartStatusesRequest(mainOrder: $mainOrder, partSymbol: $partSymbol)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadPartStatusesRequestImpl &&
            (identical(other.mainOrder, mainOrder) ||
                other.mainOrder == mainOrder) &&
            (identical(other.partSymbol, partSymbol) ||
                other.partSymbol == partSymbol));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, mainOrder, partSymbol);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadPartStatusesRequestImplCopyWith<_$LoadPartStatusesRequestImpl>
      get copyWith => __$$LoadPartStatusesRequestImplCopyWithImpl<
          _$LoadPartStatusesRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoadPartStatusesRequestImplToJson(
      this,
    );
  }
}

abstract class _LoadPartStatusesRequest implements LoadPartStatusesRequest {
  const factory _LoadPartStatusesRequest(
      {required final String mainOrder,
      required final String partSymbol}) = _$LoadPartStatusesRequestImpl;

  factory _LoadPartStatusesRequest.fromJson(Map<String, dynamic> json) =
      _$LoadPartStatusesRequestImpl.fromJson;

  @override
  String get mainOrder;
  @override
  String get partSymbol;
  @override
  @JsonKey(ignore: true)
  _$$LoadPartStatusesRequestImplCopyWith<_$LoadPartStatusesRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
