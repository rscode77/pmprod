import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication_model.freezed.dart';
part 'authentication_model.g.dart';

@freezed
class AuthenticationModel with _$AuthenticationModel {
  const factory AuthenticationModel({
    @JsonKey(name: 'Id')
    required int? id,
    @JsonKey(name: 'Username')
    required String? userName,
  }) = _AuthenticationModel;

  factory AuthenticationModel.fromJson(Map<String, dynamic> json) => _$AuthenticationModelFromJson(json);
}