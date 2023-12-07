import 'package:dio/dio.dart';
import 'package:pmprod/networking/models/part_details_model.dart';

extension ResponseExtension on Response {
  List<PartDetailModel> convertToPartDetailList() {
    return (data as List<dynamic>)
        .map((item) => PartDetailModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}