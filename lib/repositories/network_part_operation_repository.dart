import 'package:dio/dio.dart';
import 'package:pmprod/networking/endpoints.dart';
import 'package:pmprod/networking/requests/get_part_operations_request.dart';
import 'package:pmprod/networking/requests/realize_part_request.dart';
import 'package:pmprod/networking/requests/report_missing_part_request.dart';
import 'package:pmprod/repositories/part_operations_repository.dart';

class NetworkPartOperationsRepository implements PartOperationsRepository {
  final Dio dio;

  NetworkPartOperationsRepository({required this.dio});

  @override
  Future<Response> getPartOperations(GetPartOperatinsRequest request) async {
    final Response response = await dio.post(
      PartOperationsEndpoints.loadPartStatuses,
      data: request.toJson(),
    );
    return response;
  }

  @override
  Future<Response> realizePart(RealizePartRequest request) async {
    final Response response = await dio.post(
      PartOperationsEndpoints.realizePart,
      data: request.toJson(),
    );
    return response;
  }

  @override
  Future<Response> reportMissingPart(ReportMissingPartRequest request) async {
    final Response response = await dio.post(
      PartOperationsEndpoints.reportMissingPart,
      data: request.toJson(),
    );
    return response;
  }
}
