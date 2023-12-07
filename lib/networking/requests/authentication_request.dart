import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication_request.freezed.dart';
part 'authentication_request.g.dart';

@freezed
abstract class AuthenticationRequest with _$AuthenticationRequest {
  const factory AuthenticationRequest({
    required String userId,
  }) = _AuthenticationRequest;

  factory AuthenticationRequest.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationRequestFromJson(json);
}