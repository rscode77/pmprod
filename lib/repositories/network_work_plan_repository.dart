import 'package:dio/dio.dart';
import 'package:pmprod/networking/endpoints.dart';
import 'package:pmprod/repositories/work_plan_repository.dart';

class NetworkWorkPlanRepository implements WorkPlanRepository {
  final Dio dio;

  NetworkWorkPlanRepository({required this.dio});

  @override
  Future<Response> loadOrder({required String order}) async {
    final Response response = await dio.post(
      WorkPlanEndpoints.loadOrder,
      data: {'mainOrder': order},
    );
    return response;
  }

  @override
  Future<Response> loadWorkPlan({required String date}) async {
    final Response response = await dio.post(
      WorkPlanEndpoints.loadWorkPlan,
      data: {'date': date},
    );
    return response;
  }
}
