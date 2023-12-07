import 'package:freezed_annotation/freezed_annotation.dart';

part 'realize_part_request.freezed.dart';
part 'realize_part_request.g.dart';

@freezed
abstract class RealizePartRequest with _$RealizePartRequest {
  const factory RealizePartRequest({
    required String partUniqueId,
    required String quantity,
    required String username,
  }) = _RealizePartRequest;

  factory RealizePartRequest.fromJson(Map<String, dynamic> json) =>
      _$RealizePartRequestFromJson(json);
}