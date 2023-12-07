import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_missing_part_request.freezed.dart';
part 'report_missing_part_request.g.dart';

@freezed
abstract class ReportMissingPartRequest with _$ReportMissingPartRequest {
  const factory ReportMissingPartRequest({
    required String mainOrderId,
    required String partId,
    required String quantity,
    required String reportingPerson,
  }) = _ReportMissingPartRequest;

  factory ReportMissingPartRequest.fromJson(Map<String, dynamic> json) =>
      _$ReportMissingPartRequestFromJson(json);
}