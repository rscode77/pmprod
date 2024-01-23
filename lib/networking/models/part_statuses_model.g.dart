// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'part_statuses_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MissingPartModelImpl _$$MissingPartModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MissingPartModelImpl(
      quantity: json['Quantity'] as int,
      date: DateTime.parse(json['Date'] as String),
      operator: json['Operator'] as String,
      partName: json['PartName'] as String,
      order: json['Order'] as String,
      realizedQuantity: json['RealizedQuantity'] as int,
      machine: json['Machine'] as String,
      deadline: json['Deadline'] as String,
    );

Map<String, dynamic> _$$MissingPartModelImplToJson(
        _$MissingPartModelImpl instance) =>
    <String, dynamic>{
      'Quantity': instance.quantity,
      'Date': instance.date.toIso8601String(),
      'Operator': instance.operator,
      'PartName': instance.partName,
      'Order': instance.order,
      'RealizedQuantity': instance.realizedQuantity,
      'Machine': instance.machine,
      'Deadline': instance.deadline,
    };
