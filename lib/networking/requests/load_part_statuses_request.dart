import 'package:freezed_annotation/freezed_annotation.dart';

part 'load_part_statuses_request.freezed.dart';
part 'load_part_statuses_request.g.dart';

@freezed
abstract class LoadPartStatusesRequest with _$LoadPartStatusesRequest {
  const factory LoadPartStatusesRequest({
    required String mainOrder,
    required String partSymbol,
  }) = _LoadPartStatusesRequest;

  factory LoadPartStatusesRequest.fromJson(Map<String, dynamic> json) =>
      _$LoadPartStatusesRequestFromJson(json);
}