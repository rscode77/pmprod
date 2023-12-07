// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_missing_part_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReportMissingPartRequest _$ReportMissingPartRequestFromJson(
    Map<String, dynamic> json) {
  return _ReportMissingPartRequest.fromJson(json);
}

/// @nodoc
mixin _$ReportMissingPartRequest {
  String get mainOrderId => throw _privateConstructorUsedError;
  String get partId => throw _privateConstructorUsedError;
  String get quantity => throw _privateConstructorUsedError;
  String get reportingPerson => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportMissingPartRequestCopyWith<ReportMissingPartRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportMissingPartRequestCopyWith<$Res> {
  factory $ReportMissingPartRequestCopyWith(ReportMissingPartRequest value,
          $Res Function(ReportMissingPartRequest) then) =
      _$ReportMissingPartRequestCopyWithImpl<$Res, ReportMissingPartRequest>;
  @useResult
  $Res call(
      {String mainOrderId,
      String partId,
      String quantity,
      String reportingPerson});
}

/// @nodoc
class _$ReportMissingPartRequestCopyWithImpl<$Res,
        $Val extends ReportMissingPartRequest>
    implements $ReportMissingPartRequestCopyWith<$Res> {
  _$ReportMissingPartRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mainOrderId = null,
    Object? partId = null,
    Object? quantity = null,
    Object? reportingPerson = null,
  }) {
    return _then(_value.copyWith(
      mainOrderId: null == mainOrderId
          ? _value.mainOrderId
          : mainOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      partId: null == partId
          ? _value.partId
          : partId // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String,
      reportingPerson: null == reportingPerson
          ? _value.reportingPerson
          : reportingPerson // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReportMissingPartRequestImplCopyWith<$Res>
    implements $ReportMissingPartRequestCopyWith<$Res> {
  factory _$$ReportMissingPartRequestImplCopyWith(
          _$ReportMissingPartRequestImpl value,
          $Res Function(_$ReportMissingPartRequestImpl) then) =
      __$$ReportMissingPartRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String mainOrderId,
      String partId,
      String quantity,
      String reportingPerson});
}

/// @nodoc
class __$$ReportMissingPartRequestImplCopyWithImpl<$Res>
    extends _$ReportMissingPartRequestCopyWithImpl<$Res,
        _$ReportMissingPartRequestImpl>
    implements _$$ReportMissingPartRequestImplCopyWith<$Res> {
  __$$ReportMissingPartRequestImplCopyWithImpl(
      _$ReportMissingPartRequestImpl _value,
      $Res Function(_$ReportMissingPartRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mainOrderId = null,
    Object? partId = null,
    Object? quantity = null,
    Object? reportingPerson = null,
  }) {
    return _then(_$ReportMissingPartRequestImpl(
      mainOrderId: null == mainOrderId
          ? _value.mainOrderId
          : mainOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      partId: null == partId
          ? _value.partId
          : partId // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String,
      reportingPerson: null == reportingPerson
          ? _value.reportingPerson
          : reportingPerson // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReportMissingPartRequestImpl implements _ReportMissingPartRequest {
  const _$ReportMissingPartRequestImpl(
      {required this.mainOrderId,
      required this.partId,
      required this.quantity,
      required this.reportingPerson});

  factory _$ReportMissingPartRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportMissingPartRequestImplFromJson(json);

  @override
  final String mainOrderId;
  @override
  final String partId;
  @override
  final String quantity;
  @override
  final String reportingPerson;

  @override
  String toString() {
    return 'ReportMissingPartRequest(mainOrderId: $mainOrderId, partId: $partId, quantity: $quantity, reportingPerson: $reportingPerson)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportMissingPartRequestImpl &&
            (identical(other.mainOrderId, mainOrderId) ||
                other.mainOrderId == mainOrderId) &&
            (identical(other.partId, partId) || other.partId == partId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.reportingPerson, reportingPerson) ||
                other.reportingPerson == reportingPerson));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, mainOrderId, partId, quantity, reportingPerson);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportMissingPartRequestImplCopyWith<_$ReportMissingPartRequestImpl>
      get copyWith => __$$ReportMissingPartRequestImplCopyWithImpl<
          _$ReportMissingPartRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportMissingPartRequestImplToJson(
      this,
    );
  }
}

abstract class _ReportMissingPartRequest implements ReportMissingPartRequest {
  const factory _ReportMissingPartRequest(
      {required final String mainOrderId,
      required final String partId,
      required final String quantity,
      required final String reportingPerson}) = _$ReportMissingPartRequestImpl;

  factory _ReportMissingPartRequest.fromJson(Map<String, dynamic> json) =
      _$ReportMissingPartRequestImpl.fromJson;

  @override
  String get mainOrderId;
  @override
  String get partId;
  @override
  String get quantity;
  @override
  String get reportingPerson;
  @override
  @JsonKey(ignore: true)
  _$$ReportMissingPartRequestImplCopyWith<_$ReportMissingPartRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
