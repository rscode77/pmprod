// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'load_part_statuses_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoadPartStatusesRequestImpl _$$LoadPartStatusesRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$LoadPartStatusesRequestImpl(
      mainOrder: json['mainOrder'] as String,
      partSymbol: json['partSymbol'] as String,
    );

Map<String, dynamic> _$$LoadPartStatusesRequestImplToJson(
        _$LoadPartStatusesRequestImpl instance) =>
    <String, dynamic>{
      'mainOrder': instance.mainOrder,
      'partSymbol': instance.partSymbol,
    };
