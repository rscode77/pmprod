// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'realize_part_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RealizePartRequestImpl _$$RealizePartRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$RealizePartRequestImpl(
      partUniqueId: json['partUniqueId'] as String,
      quantity: json['quantity'] as String,
      username: json['username'] as String,
    );

Map<String, dynamic> _$$RealizePartRequestImplToJson(
        _$RealizePartRequestImpl instance) =>
    <String, dynamic>{
      'partUniqueId': instance.partUniqueId,
      'quantity': instance.quantity,
      'username': instance.username,
    };
