// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_missing_part_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReportMissingPartRequestImpl _$$ReportMissingPartRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$ReportMissingPartRequestImpl(
      mainOrderId: json['mainOrderId'] as String,
      partId: json['partId'] as String,
      quantity: json['quantity'] as String,
      reportingPerson: json['reportingPerson'] as String,
    );

Map<String, dynamic> _$$ReportMissingPartRequestImplToJson(
        _$ReportMissingPartRequestImpl instance) =>
    <String, dynamic>{
      'mainOrderId': instance.mainOrderId,
      'partId': instance.partId,
      'quantity': instance.quantity,
      'reportingPerson': instance.reportingPerson,
    };
