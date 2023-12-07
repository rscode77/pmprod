import 'package:dio/dio.dart';

abstract class WorkPlanRepository {
  Future<Response> loadOrder({required String order});
  Future<Response> loadWorkPlan({required String date});
}