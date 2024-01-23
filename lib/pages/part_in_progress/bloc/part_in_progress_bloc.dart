import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pmprod/networking/models/production_order_model.dart';
import 'package:pmprod/repositories/prodiction_order_repository.dart';

part 'part_in_progress_event.dart';

part 'part_in_progress_state.dart';

class PartInProgressBloc extends Bloc<PartInProgressEvent, PartInProgressState> {
  final ProductionOrderRepository productionOrderRepository;

  PartInProgressBloc({required this.productionOrderRepository}) : super(PartInProgressInitial()) {
    on<InitPartInProgress>(_onInitPartInProgress);
    add(InitPartInProgress());
  }

  final StreamController<List<ProductionOrderModel>> _productionOrdersController =
      StreamController<List<ProductionOrderModel>>.broadcast();

  Stream<List<ProductionOrderModel>> get productionOrdersStream => _productionOrdersController.stream;

  FutureOr<void> _onInitPartInProgress(InitPartInProgress event, Emitter<PartInProgressState> emit) {
    productionOrderRepository.getProductionOrdersStream().listen(
      (List<ProductionOrderModel> productionOrders) {
        _productionOrdersController.add(productionOrders);
      },
    );
  }
}
