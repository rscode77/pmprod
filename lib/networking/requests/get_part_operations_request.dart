import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_part_operations_request.freezed.dart';
part 'get_part_operations_request.g.dart';

@freezed
abstract class GetPartOperatinsRequest with _$GetPartOperatinsRequest {
  const factory GetPartOperatinsRequest({
    required String partSymbol,
    required String mainOrder,
  }) = _GetPartOperatinsRequest;

  factory GetPartOperatinsRequest.fromJson(Map<String, dynamic> json) =>
      _$GetPartOperatinsRequestFromJson(json);
}