import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:pmprod/networking/models/production_order_model.dart';

class ProductionOrderRepository {
  final DatabaseReference _database = FirebaseDatabase.instance.ref().child('productionOrders');

  Future<void> addProductionOrder(ProductionOrderModel order) async {
    DatabaseReference newRef = _database.push();
    await newRef.set(order.toMap());
  }

  Stream<List<ProductionOrderModel>> getProductionOrdersStream() {
    return _database.onValue.map((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>? ?? {};
      return data.entries.map((entry) => ProductionOrderModel.fromMap(entry.value)).toList();
    });
  }

  void removeProductionOrder({
    required int partUniqueId,
    required String operatorName,
  }) {
    _database.once().then(
      (DatabaseEvent dataSnapShot) {
        Map<dynamic, dynamic> values = dataSnapShot.snapshot.value as Map<dynamic, dynamic>;
        values.forEach((key, values) {
          if (values['operator'] == operatorName && values['partUniqueId'] == partUniqueId) {
            _database.child(key).remove();
          }
        });
      },
    );
  }
}
