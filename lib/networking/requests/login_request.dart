import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_request.freezed.dart';
part 'login_request.g.dart';

@freezed

@JsonSerializable(
  createToJson: true,
)
class LoginRequest with _$LoginRequest {
  const factory LoginRequest({
    required String userId,
  }) = _LoginRequest;
}
