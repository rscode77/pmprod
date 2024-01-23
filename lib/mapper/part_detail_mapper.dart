import 'package:pmprod/networking/models/part_details_model.dart';
import 'package:pmprod/networking/models/production_order_model.dart';

PartDetailModel mapProductionOrderToPartDetail(ProductionOrderModel productionOrder) {
  return PartDetailModel(
    productionOrder: productionOrder.productionOrder,
    partName: productionOrder.partName,
    quantity: productionOrder.quantity.toDouble(),
    contractor: productionOrder.contractor,
    mainOrder: productionOrder.mainOrder,
    mainOrderId: 0, // Add appropriate mapping
    partSymbol: '', // Add appropriate mapping
    draw: productionOrder.draw,
    material: productionOrder.material,
    deadline: DateTime.now(), // Add appropriate mapping
    realizedQuantity: productionOrder.realizedQuantity.toDouble(),
    partId: 0, // Add appropriate mapping
    partUniqueId: productionOrder.partUniqueId,
    comments: '', // Add appropriate mapping
    magazine: Magazine.mp4, // Add appropriate mapping
  );
}