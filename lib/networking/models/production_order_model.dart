class ProductionOrderModel {
  late String productionOrder;
  late String partName;
  late int quantity;
  late String contractor;
  late String mainOrder;
  String? draw;
  late String material;
  late int realizedQuantity;
  late String operator;
  late int partUniqueId;
  late int timestamp;

  ProductionOrderModel({
    required this.productionOrder,
    required this.partName,
    required this.quantity,
    required this.contractor,
    required this.mainOrder,
    this.draw,
    required this.material,
    required this.realizedQuantity,
    required this.operator,
    required this.partUniqueId,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'productionOrder': productionOrder,
      'partName': partName,
      'quantity': quantity,
      'contractor': contractor,
      'mainOrder': mainOrder,
      'draw': draw,
      'material': material,
      'realizedQuantity': realizedQuantity,
      'operator': operator,
      'partUniqueId': partUniqueId,
      'timestamp': timestamp,
    };
  }

  factory ProductionOrderModel.fromMap(Map<dynamic, dynamic> map) {
    return ProductionOrderModel(
      productionOrder: map['productionOrder'] ?? '',
      partName: map['partName'] ?? '',
      quantity: map['quantity'] ?? 0,
      contractor: map['contractor'] ?? '',
      mainOrder: map['mainOrder'] ?? '',
      draw: map['draw'],
      material: map['material'] ?? '',
      realizedQuantity: map['realizedQuantity'] ?? 0.0,
      operator: map['operator'] ?? '',
      partUniqueId: map['partUniqueId'] ?? 0,
      timestamp: map['timestamp'] ?? 0,
    );
  }
}
