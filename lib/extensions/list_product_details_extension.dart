import 'package:dio/dio.dart';
import 'package:pmprod/networking/models/part_details_model.dart';

extension ListProductDetailsExtension on List<PartDetailModel> {
  List<PartDetailModel> filterByQuery({
    required String query,
  }) {
    return where(
      (part) {
        final String lowerCaseQuery = query.toLowerCase();
        final String partName = part.partName.toLowerCase();
        final String contractor = part.contractor.toLowerCase();
        final String mainOrder = part.mainOrder.toLowerCase();
        final String productionOrder = part.productionOrder.toLowerCase();
        final String material = part.material.toLowerCase();

        return partName.contains(lowerCaseQuery) ||
            contractor.contains(lowerCaseQuery) ||
            mainOrder.contains(lowerCaseQuery) ||
            productionOrder.contains(lowerCaseQuery) ||
            material.contains(lowerCaseQuery);
      },
    ).toList();
  }

  List<PartDetailModel> filterByQueryAndQuantity() {
    return where(
      (part) {
        return _isRealizedPartLessThan(part);
      },
    ).toList();
  }

  bool _isRealizedPartLessThan(PartDetailModel part) {
    return part.realizedQuantity < part.quantity;
  }
}
