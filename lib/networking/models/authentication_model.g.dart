// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthenticationModelImpl _$$AuthenticationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AuthenticationModelImpl(
      id: json['Id'] as int?,
      userName: json['Username'] as String?,
    );

Map<String, dynamic> _$$AuthenticationModelImplToJson(
        _$AuthenticationModelImpl instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Username': instance.userName,
    };
