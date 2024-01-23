// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'part_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PartDetailModel _$PartDetailModelFromJson(Map<String, dynamic> json) {
  return _PartDetailModel.fromJson(json);
}

/// @nodoc
mixin _$PartDetailModel {
  @JsonKey(name: 'ProductionOrder')
  String get productionOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'PartName')
  String get partName => throw _privateConstructorUsedError;
  @JsonKey(name: 'Quantity')
  double get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'Contractor')
  String get contractor => throw _privateConstructorUsedError;
  @JsonKey(name: 'MainOrder')
  String get mainOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'MainOrderId')
  int get mainOrderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'PartSymbol')
  String get partSymbol => throw _privateConstructorUsedError;
  @JsonKey(name: 'Draw')
  String? get draw => throw _privateConstructorUsedError;
  @JsonKey(name: 'Material')
  String get material => throw _privateConstructorUsedError;
  @JsonKey(name: 'Deadline')
  DateTime get deadline => throw _privateConstructorUsedError;
  @JsonKey(name: 'RealizedQuantity')
  double get realizedQuantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'PartId')
  int get partId => throw _privateConstructorUsedError;
  @JsonKey(name: 'PartUniqueId')
  int get partUniqueId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Comments')
  String get comments => throw _privateConstructorUsedError;
  @JsonKey(name: 'Magazine')
  Magazine get magazine => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PartDetailModelCopyWith<PartDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PartDetailModelCopyWith<$Res> {
  factory $PartDetailModelCopyWith(
          PartDetailModel value, $Res Function(PartDetailModel) then) =
      _$PartDetailModelCopyWithImpl<$Res, PartDetailModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ProductionOrder') String productionOrder,
      @JsonKey(name: 'PartName') String partName,
      @JsonKey(name: 'Quantity') double quantity,
      @JsonKey(name: 'Contractor') String contractor,
      @JsonKey(name: 'MainOrder') String mainOrder,
      @JsonKey(name: 'MainOrderId') int mainOrderId,
      @JsonKey(name: 'PartSymbol') String partSymbol,
      @JsonKey(name: 'Draw') String? draw,
      @JsonKey(name: 'Material') String material,
      @JsonKey(name: 'Deadline') DateTime deadline,
      @JsonKey(name: 'RealizedQuantity') double realizedQuantity,
      @JsonKey(name: 'PartId') int partId,
      @JsonKey(name: 'PartUniqueId') int partUniqueId,
      @JsonKey(name: 'Comments') String comments,
      @JsonKey(name: 'Magazine') Magazine magazine});
}

/// @nodoc
class _$PartDetailModelCopyWithImpl<$Res, $Val extends PartDetailModel>
    implements $PartDetailModelCopyWith<$Res> {
  _$PartDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productionOrder = null,
    Object? partName = null,
    Object? quantity = null,
    Object? contractor = null,
    Object? mainOrder = null,
    Object? mainOrderId = null,
    Object? partSymbol = null,
    Object? draw = freezed,
    Object? material = null,
    Object? deadline = null,
    Object? realizedQuantity = null,
    Object? partId = null,
    Object? partUniqueId = null,
    Object? comments = null,
    Object? magazine = null,
  }) {
    return _then(_value.copyWith(
      productionOrder: null == productionOrder
          ? _value.productionOrder
          : productionOrder // ignore: cast_nullable_to_non_nullable
              as String,
      partName: null == partName
          ? _value.partName
          : partName // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      contractor: null == contractor
          ? _value.contractor
          : contractor // ignore: cast_nullable_to_non_nullable
              as String,
      mainOrder: null == mainOrder
          ? _value.mainOrder
          : mainOrder // ignore: cast_nullable_to_non_nullable
              as String,
      mainOrderId: null == mainOrderId
          ? _value.mainOrderId
          : mainOrderId // ignore: cast_nullable_to_non_nullable
              as int,
      partSymbol: null == partSymbol
          ? _value.partSymbol
          : partSymbol // ignore: cast_nullable_to_non_nullable
              as String,
      draw: freezed == draw
          ? _value.draw
          : draw // ignore: cast_nullable_to_non_nullable
              as String?,
      material: null == material
          ? _value.material
          : material // ignore: cast_nullable_to_non_nullable
              as String,
      deadline: null == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime,
      realizedQuantity: null == realizedQuantity
          ? _value.realizedQuantity
          : realizedQuantity // ignore: cast_nullable_to_non_nullable
              as double,
      partId: null == partId
          ? _value.partId
          : partId // ignore: cast_nullable_to_non_nullable
              as int,
      partUniqueId: null == partUniqueId
          ? _value.partUniqueId
          : partUniqueId // ignore: cast_nullable_to_non_nullable
              as int,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as String,
      magazine: null == magazine
          ? _value.magazine
          : magazine // ignore: cast_nullable_to_non_nullable
              as Magazine,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PartDetailModelImplCopyWith<$Res>
    implements $PartDetailModelCopyWith<$Res> {
  factory _$$PartDetailModelImplCopyWith(_$PartDetailModelImpl value,
          $Res Function(_$PartDetailModelImpl) then) =
      __$$PartDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ProductionOrder') String productionOrder,
      @JsonKey(name: 'PartName') String partName,
      @JsonKey(name: 'Quantity') double quantity,
      @JsonKey(name: 'Contractor') String contractor,
      @JsonKey(name: 'MainOrder') String mainOrder,
      @JsonKey(name: 'MainOrderId') int mainOrderId,
      @JsonKey(name: 'PartSymbol') String partSymbol,
      @JsonKey(name: 'Draw') String? draw,
      @JsonKey(name: 'Material') String material,
      @JsonKey(name: 'Deadline') DateTime deadline,
      @JsonKey(name: 'RealizedQuantity') double realizedQuantity,
      @JsonKey(name: 'PartId') int partId,
      @JsonKey(name: 'PartUniqueId') int partUniqueId,
      @JsonKey(name: 'Comments') String comments,
      @JsonKey(name: 'Magazine') Magazine magazine});
}

/// @nodoc
class __$$PartDetailModelImplCopyWithImpl<$Res>
    extends _$PartDetailModelCopyWithImpl<$Res, _$PartDetailModelImpl>
    implements _$$PartDetailModelImplCopyWith<$Res> {
  __$$PartDetailModelImplCopyWithImpl(
      _$PartDetailModelImpl _value, $Res Function(_$PartDetailModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productionOrder = null,
    Object? partName = null,
    Object? quantity = null,
    Object? contractor = null,
    Object? mainOrder = null,
    Object? mainOrderId = null,
    Object? partSymbol = null,
    Object? draw = freezed,
    Object? material = null,
    Object? deadline = null,
    Object? realizedQuantity = null,
    Object? partId = null,
    Object? partUniqueId = null,
    Object? comments = null,
    Object? magazine = null,
  }) {
    return _then(_$PartDetailModelImpl(
      productionOrder: null == productionOrder
          ? _value.productionOrder
          : productionOrder // ignore: cast_nullable_to_non_nullable
              as String,
      partName: null == partName
          ? _value.partName
          : partName // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      contractor: null == contractor
          ? _value.contractor
          : contractor // ignore: cast_nullable_to_non_nullable
              as String,
      mainOrder: null == mainOrder
          ? _value.mainOrder
          : mainOrder // ignore: cast_nullable_to_non_nullable
              as String,
      mainOrderId: null == mainOrderId
          ? _value.mainOrderId
          : mainOrderId // ignore: cast_nullable_to_non_nullable
              as int,
      partSymbol: null == partSymbol
          ? _value.partSymbol
          : partSymbol // ignore: cast_nullable_to_non_nullable
              as String,
      draw: freezed == draw
          ? _value.draw
          : draw // ignore: cast_nullable_to_non_nullable
              as String?,
      material: null == material
          ? _value.material
          : material // ignore: cast_nullable_to_non_nullable
              as String,
      deadline: null == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime,
      realizedQuantity: null == realizedQuantity
          ? _value.realizedQuantity
          : realizedQuantity // ignore: cast_nullable_to_non_nullable
              as double,
      partId: null == partId
          ? _value.partId
          : partId // ignore: cast_nullable_to_non_nullable
              as int,
      partUniqueId: null == partUniqueId
          ? _value.partUniqueId
          : partUniqueId // ignore: cast_nullable_to_non_nullable
              as int,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as String,
      magazine: null == magazine
          ? _value.magazine
          : magazine // ignore: cast_nullable_to_non_nullable
              as Magazine,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PartDetailModelImpl implements _PartDetailModel {
  const _$PartDetailModelImpl(
      {@JsonKey(name: 'ProductionOrder') required this.productionOrder,
      @JsonKey(name: 'PartName') required this.partName,
      @JsonKey(name: 'Quantity') required this.quantity,
      @JsonKey(name: 'Contractor') required this.contractor,
      @JsonKey(name: 'MainOrder') required this.mainOrder,
      @JsonKey(name: 'MainOrderId') required this.mainOrderId,
      @JsonKey(name: 'PartSymbol') required this.partSymbol,
      @JsonKey(name: 'Draw') required this.draw,
      @JsonKey(name: 'Material') required this.material,
      @JsonKey(name: 'Deadline') required this.deadline,
      @JsonKey(name: 'RealizedQuantity') required this.realizedQuantity,
      @JsonKey(name: 'PartId') required this.partId,
      @JsonKey(name: 'PartUniqueId') required this.partUniqueId,
      @JsonKey(name: 'Comments') required this.comments,
      @JsonKey(name: 'Magazine') required this.magazine});

  factory _$PartDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PartDetailModelImplFromJson(json);

  @override
  @JsonKey(name: 'ProductionOrder')
  final String productionOrder;
  @override
  @JsonKey(name: 'PartName')
  final String partName;
  @override
  @JsonKey(name: 'Quantity')
  final double quantity;
  @override
  @JsonKey(name: 'Contractor')
  final String contractor;
  @override
  @JsonKey(name: 'MainOrder')
  final String mainOrder;
  @override
  @JsonKey(name: 'MainOrderId')
  final int mainOrderId;
  @override
  @JsonKey(name: 'PartSymbol')
  final String partSymbol;
  @override
  @JsonKey(name: 'Draw')
  final String? draw;
  @override
  @JsonKey(name: 'Material')
  final String material;
  @override
  @JsonKey(name: 'Deadline')
  final DateTime deadline;
  @override
  @JsonKey(name: 'RealizedQuantity')
  final double realizedQuantity;
  @override
  @JsonKey(name: 'PartId')
  final int partId;
  @override
  @JsonKey(name: 'PartUniqueId')
  final int partUniqueId;
  @override
  @JsonKey(name: 'Comments')
  final String comments;
  @override
  @JsonKey(name: 'Magazine')
  final Magazine magazine;

  @override
  String toString() {
    return 'PartDetailModel(productionOrder: $productionOrder, partName: $partName, quantity: $quantity, contractor: $contractor, mainOrder: $mainOrder, mainOrderId: $mainOrderId, partSymbol: $partSymbol, draw: $draw, material: $material, deadline: $deadline, realizedQuantity: $realizedQuantity, partId: $partId, partUniqueId: $partUniqueId, comments: $comments, magazine: $magazine)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PartDetailModelImpl &&
            (identical(other.productionOrder, productionOrder) ||
                other.productionOrder == productionOrder) &&
            (identical(other.partName, partName) ||
                other.partName == partName) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.contractor, contractor) ||
                other.contractor == contractor) &&
            (identical(other.mainOrder, mainOrder) ||
                other.mainOrder == mainOrder) &&
            (identical(other.mainOrderId, mainOrderId) ||
                other.mainOrderId == mainOrderId) &&
            (identical(other.partSymbol, partSymbol) ||
                other.partSymbol == partSymbol) &&
            (identical(other.draw, draw) || other.draw == draw) &&
            (identical(other.material, material) ||
                other.material == material) &&
            (identical(other.deadline, deadline) ||
                other.deadline == deadline) &&
            (identical(other.realizedQuantity, realizedQuantity) ||
                other.realizedQuantity == realizedQuantity) &&
            (identical(other.partId, partId) || other.partId == partId) &&
            (identical(other.partUniqueId, partUniqueId) ||
                other.partUniqueId == partUniqueId) &&
            (identical(other.comments, comments) ||
                other.comments == comments) &&
            (identical(other.magazine, magazine) ||
                other.magazine == magazine));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      productionOrder,
      partName,
      quantity,
      contractor,
      mainOrder,
      mainOrderId,
      partSymbol,
      draw,
      material,
      deadline,
      realizedQuantity,
      partId,
      partUniqueId,
      comments,
      magazine);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PartDetailModelImplCopyWith<_$PartDetailModelImpl> get copyWith =>
      __$$PartDetailModelImplCopyWithImpl<_$PartDetailModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PartDetailModelImplToJson(
      this,
    );
  }
}

abstract class _PartDetailModel implements PartDetailModel {
  const factory _PartDetailModel(
      {@JsonKey(name: 'ProductionOrder') required final String productionOrder,
      @JsonKey(name: 'PartName') required final String partName,
      @JsonKey(name: 'Quantity') required final double quantity,
      @JsonKey(name: 'Contractor') required final String contractor,
      @JsonKey(name: 'MainOrder') required final String mainOrder,
      @JsonKey(name: 'MainOrderId') required final int mainOrderId,
      @JsonKey(name: 'PartSymbol') required final String partSymbol,
      @JsonKey(name: 'Draw') required final String? draw,
      @JsonKey(name: 'Material') required final String material,
      @JsonKey(name: 'Deadline') required final DateTime deadline,
      @JsonKey(name: 'RealizedQuantity') required final double realizedQuantity,
      @JsonKey(name: 'PartId') required final int partId,
      @JsonKey(name: 'PartUniqueId') required final int partUniqueId,
      @JsonKey(name: 'Comments') required final String comments,
      @JsonKey(name: 'Magazine')
      required final Magazine magazine}) = _$PartDetailModelImpl;

  factory _PartDetailModel.fromJson(Map<String, dynamic> json) =
      _$PartDetailModelImpl.fromJson;

  @override
  @JsonKey(name: 'ProductionOrder')
  String get productionOrder;
  @override
  @JsonKey(name: 'PartName')
  String get partName;
  @override
  @JsonKey(name: 'Quantity')
  double get quantity;
  @override
  @JsonKey(name: 'Contractor')
  String get contractor;
  @override
  @JsonKey(name: 'MainOrder')
  String get mainOrder;
  @override
  @JsonKey(name: 'MainOrderId')
  int get mainOrderId;
  @override
  @JsonKey(name: 'PartSymbol')
  String get partSymbol;
  @override
  @JsonKey(name: 'Draw')
  String? get draw;
  @override
  @JsonKey(name: 'Material')
  String get material;
  @override
  @JsonKey(name: 'Deadline')
  DateTime get deadline;
  @override
  @JsonKey(name: 'RealizedQuantity')
  double get realizedQuantity;
  @override
  @JsonKey(name: 'PartId')
  int get partId;
  @override
  @JsonKey(name: 'PartUniqueId')
  int get partUniqueId;
  @override
  @JsonKey(name: 'Comments')
  String get comments;
  @override
  @JsonKey(name: 'Magazine')
  Magazine get magazine;
  @override
  @JsonKey(ignore: true)
  _$$PartDetailModelImplCopyWith<_$PartDetailModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
