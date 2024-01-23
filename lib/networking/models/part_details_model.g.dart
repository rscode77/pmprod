// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'part_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PartDetailModelImpl _$$PartDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PartDetailModelImpl(
      productionOrder: json['ProductionOrder'] as String,
      partName: json['PartName'] as String,
      quantity: (json['Quantity'] as num).toDouble(),
      contractor: json['Contractor'] as String,
      mainOrder: json['MainOrder'] as String,
      mainOrderId: json['MainOrderId'] as int,
      partSymbol: json['PartSymbol'] as String,
      draw: json['Draw'] as String?,
      material: json['Material'] as String,
      deadline: DateTime.parse(json['Deadline'] as String),
      realizedQuantity: (json['RealizedQuantity'] as num).toDouble(),
      partId: json['PartId'] as int,
      partUniqueId: json['PartUniqueId'] as int,
      comments: json['Comments'] as String,
      magazine: $enumDecode(_$MagazineEnumMap, json['Magazine']),
    );

Map<String, dynamic> _$$PartDetailModelImplToJson(
        _$PartDetailModelImpl instance) =>
    <String, dynamic>{
      'ProductionOrder': instance.productionOrder,
      'PartName': instance.partName,
      'Quantity': instance.quantity,
      'Contractor': instance.contractor,
      'MainOrder': instance.mainOrder,
      'MainOrderId': instance.mainOrderId,
      'PartSymbol': instance.partSymbol,
      'Draw': instance.draw,
      'Material': instance.material,
      'Deadline': instance.deadline.toIso8601String(),
      'RealizedQuantity': instance.realizedQuantity,
      'PartId': instance.partId,
      'PartUniqueId': instance.partUniqueId,
      'Comments': instance.comments,
      'Magazine': _$MagazineEnumMap[instance.magazine]!,
    };

const _$MagazineEnumMap = {
  Magazine.mp1: 'MP1',
  Magazine.mp4: 'MP4',
  Magazine.mp6: 'MP6',
  Magazine.mp8: 'MP8',
};
