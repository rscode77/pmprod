import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pmprod/bloc/authentication_bloc.dart';
import 'package:pmprod/extensions/response_extension.dart';
import 'package:pmprod/networking/models/part_details_model.dart';
import 'package:pmprod/networking/models/part_statuses_model.dart';
import 'package:pmprod/networking/models/production_order_model.dart';
import 'package:pmprod/networking/requests/get_part_operations_request.dart';
import 'package:pmprod/networking/requests/realize_part_request.dart';
import 'package:pmprod/networking/requests/report_missing_part_request.dart';
import 'package:pmprod/pages/work_plan/bloc/work_plan_bloc.dart';
import 'package:pmprod/repositories/part_operations_repository.dart';
import 'package:pmprod/repositories/prodiction_order_repository.dart';

part 'part_details_event.dart';

part 'part_details_state.dart';

class PartDetailBloc extends Bloc<PartDetailsEvent, PartDetailsState> {
  final PartOperationsRepository partOperationsRepository;
  final ProductionOrderRepository productionOrderRepository;
  final WorkPlanBloc workPlanBloc;
  final AuthenticationBloc authenticationBloc;
  PartDetailModel selectedPart;

  PartDetailBloc({
    required this.authenticationBloc,
    required this.selectedPart,
    required this.partOperationsRepository,
    required this.productionOrderRepository,
    required this.workPlanBloc,
  }) : super(PartDetailsInitial()) {
    on<PartDetailsInitialEvent>(_onPartDetailsInitial);
    on<UpdateQuantityEvent>(_onUpdateQuantityEvent);
    on<ReportMissingPartEvent>(_onReportMissingPartEvent);
    on<LoadPartOrderStatuses>(_onLoadPartOrderStatuses);
    add(PartDetailsInitialEvent());
  }

  final StreamController<List<ProductionOrderModel>> _productionOrdersController =
      StreamController<List<ProductionOrderModel>>.broadcast();

  Stream<List<ProductionOrderModel>> get productionOrdersStream => _productionOrdersController.stream;

  ValueNotifier<bool> isPartInProgress = ValueNotifier(false);

  ValueNotifier<List<PartStatusesModel>> partStatuses = ValueNotifier([]);

  Future<void> _onUpdateQuantityEvent(
    UpdateQuantityEvent event,
    Emitter<PartDetailsState> emit,
  ) async {
    emit(PartUpdateQuantityLoading());
    if (isPartInProgress.value) {
      productionOrderRepository.removeProductionOrder(
        partUniqueId: selectedPart.partUniqueId,
        operatorName: event.username,
      );
      emit(const PartUpdateQuantity(success: true));
    } else {
      productionOrderRepository.addProductionOrder(
        ProductionOrderModel(
          productionOrder: selectedPart.productionOrder,
          partName: selectedPart.partName,
          quantity: selectedPart.quantity.toInt(),
          contractor: selectedPart.contractor,
          mainOrder: selectedPart.mainOrder,
          material: selectedPart.material,
          realizedQuantity: isPartInProgress.value ? event.quantity : selectedPart.realizedQuantity.toInt(),
          operator: event.username,
          partUniqueId: selectedPart.partUniqueId,
          timestamp: DateTime.now().millisecondsSinceEpoch,
          draw: selectedPart.draw,
        ),
      );
    }

    try {
      emit(
        PartDetailLoaded(
          selectedPart: selectedPart.copyWith(realizedQuantity: event.quantity.toDouble()),
        ),
      );
      Response updatePartQuantity = await partOperationsRepository.realizePart(
        RealizePartRequest(
          partUniqueId: selectedPart.partUniqueId.toString(),
          quantity: event.quantity.toString(),
          username: event.username,
        ),
      );
      if (updatePartQuantity.isSuccessful) {
        workPlanBloc.add(
          UpdateWorkPlanQuantity(
            quantity: event.quantity,
            partUniqueId: selectedPart.partUniqueId,
          ),
        );
      }
    } catch (e) {
      emit(const PartUpdateQuantity(success: false));
    }
  }

  Future<void> _onReportMissingPartEvent(ReportMissingPartEvent event, Emitter<PartDetailsState> emit) async {
    final PartDetailsState currentState = state;
    emit(PartMissingQuantityLoading());
    try {
      Response reportMissingPart = await partOperationsRepository.reportMissingPart(ReportMissingPartRequest(
        partId: selectedPart.partId.toString(),
        quantity: event.quantity.toString(),
        mainOrderId: selectedPart.mainOrderId.toString(),
        reportingPerson: event.reportingPerson,
      ));
      if (reportMissingPart.isSuccessful) {
        return emit(const PartMissingQuantityReported(success: true));
      }
      emit(const PartMissingQuantityReported(success: false));
    } catch (e) {
      emit(const PartMissingQuantityReported(success: false));
    } finally {
      emit(currentState);
    }
  }

  void _onLoadPartOrderStatuses(LoadPartOrderStatuses event, Emitter<PartDetailsState> emit) async {
    emit(PartOrderStatusesLoading());
    try {
      Response partOrders = await partOperationsRepository.loadPartStatuses(GetPartOperatinsRequest(
        mainOrder: selectedPart.mainOrder,
        partSymbol: selectedPart.partSymbol,
      ));
      partStatuses?.value = partOrders.convertToPartStatusesList();
    } catch (_) {
      emit(const PartOrderStatusesLoaded(success: false));
    }
    emit(const PartOrderStatusesLoaded(success: true));
  }

  Future<FutureOr<void>> _onPartDetailsInitial(PartDetailsInitialEvent event, Emitter<PartDetailsState> emit) async {
    productionOrderRepository.getProductionOrdersStream().listen(
      (List<ProductionOrderModel> productionOrders) {
        _productionOrdersController.add(productionOrders);
        isPartInProgress.value = productionOrders.any((order) =>
            order.partUniqueId == selectedPart.partUniqueId &&
            order.operator == authenticationBloc.loggedInUsername.value);
      },
    );

    Response partComments = await partOperationsRepository.getPartTechnologyCart(selectedPart.partSymbol);
    if (partComments.isSuccessful) {
      var data = json.decode(partComments.data);
      String result = data["Comments"];

      if (result.isNotEmpty) {
        emit(PartDetailLoaded(selectedPart: selectedPart.copyWith(comments: result)));
      }
    }
  }
}
