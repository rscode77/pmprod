import 'package:dio/dio.dart';
import 'package:pmprod/networking/requests/get_part_operations_request.dart';
import 'package:pmprod/networking/requests/realize_part_request.dart';
import 'package:pmprod/networking/requests/report_missing_part_request.dart';

abstract class PartOperationsRepository {
 Future<Response> reportMissingPart(ReportMissingPartRequest request);
 Future<Response> realizePart(RealizePartRequest request);
 Future<Response> getPartOperations(GetPartOperatinsRequest request);
}
