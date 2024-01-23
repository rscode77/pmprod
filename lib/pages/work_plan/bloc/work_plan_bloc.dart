import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:pmprod/extensions/datetime_extension.dart';
import 'package:pmprod/extensions/list_product_details_extension.dart';
import 'package:pmprod/extensions/response_extension.dart';
import 'package:pmprod/networking/models/part_details_model.dart';
import 'package:pmprod/networking/models/production_order_model.dart';
import 'package:pmprod/repositories/prodiction_order_repository.dart';
import 'package:pmprod/repositories/work_plan_repository.dart';

part 'work_plan_event.dart';

part 'work_plan_state.dart';

class WorkPlanBloc extends Bloc<WorkPlanEvent, WorkPlanState> {
  final WorkPlanRepository workPlanRepository;
  final ProductionOrderRepository productionOrderRepository;

  WorkPlanBloc({
    required this.workPlanRepository,
    required this.productionOrderRepository,
  }) : super(const WorkPlanInitial([])) {
    on<WorkPlanInitialEvent>(_onWorkPlanInitialEvent);
    on<LoadOrderEvent>(_onLoadOrderEvent);
    on<LoadWorkPlanEvent>(_onLoadWorkPlanEvent);
    on<UpdateSelectedDateEvent>(_onUpdateSelectedDateEvent);
    on<SearchInWorkPlanEvent>(_onSearchInWorkPlanEvent);
    on<UpdateWorkPlanQuantity>(_onUpdateWorkPlanQuantity);
    on<SetWorkPlanNotRealized>(_onSetWorkPlanNotRealized);
    add(const WorkPlanInitialEvent());
  }

  List<PartDetailModel> workPlan = [];

  ValueNotifier<bool> workPlanShowNotRealized = ValueNotifier(false);

  void _onWorkPlanInitialEvent(WorkPlanInitialEvent event, Emitter<WorkPlanState> emit) {
    emit(WorkPlanLoading());
    add(LoadWorkPlanEvent(date: DateTime.now()));
  }

  Future<void> _onLoadWorkPlanEvent(LoadWorkPlanEvent event, Emitter<WorkPlanState> emit) async {
    emit(WorkPlanLoading());
    Response loadWorkPlan = await workPlanRepository.loadWorkPlan(date: event.date.getOnlyDate);
    if (loadWorkPlan.statusCode != 200) return;
    final List<PartDetailModel> parts = loadWorkPlan.convertToPartDetailList();
    workPlan = parts;
    emit(WorkPlanLoaded(
      selectedDate: event.date,
      workPlan: workPlan,
    ));
  }

  void _onUpdateSelectedDateEvent(UpdateSelectedDateEvent event, Emitter<WorkPlanState> emit) {
    add(LoadWorkPlanEvent(date: event.date));
  }

  void _onSearchInWorkPlanEvent(SearchInWorkPlanEvent event, Emitter<WorkPlanState> emit) {
    emit(WorkPlanLoading());
    List<PartDetailModel> filteredParts = workPlan.filterByQuery(query: event.query);
    if (workPlanShowNotRealized.value) {
      filteredParts = filteredParts.filterByQueryAndQuantity();
    }
    emit(
      WorkPlanLoaded(
        selectedDate: event.date,
        workPlan: filteredParts,
      ),
    );
  }

  Future<void> _onLoadOrderEvent(LoadOrderEvent event, Emitter<WorkPlanState> emit) async {
    emit(WorkPlanLoading());
    Response loadWorkPlan = await workPlanRepository.loadOrder(order: event.order);
    if (loadWorkPlan.statusCode != 200) return;
    final List<PartDetailModel> parts = loadWorkPlan.convertToPartDetailList();
    workPlan = parts;
    emit(WorkPlanLoaded(
      selectedDate: DateTime.now(),
      workPlan: workPlan,
    ));
  }

  void _onUpdateWorkPlanQuantity(UpdateWorkPlanQuantity event, Emitter<WorkPlanState> emit) {
    List<PartDetailModel> updatedWorkPlan = workPlan.map((part) {
      if (part.partUniqueId == event.partUniqueId) {
        return part.copyWith(
          realizedQuantity: event.quantity.toDouble(),
        );
      }
      return part;
    }).toList();

    final WorkPlanLoaded currentState = state as WorkPlanLoaded;
    emit(
      WorkPlanLoaded(
        selectedDate: currentState.selectedDate,
        workPlan: updatedWorkPlan,
      ),
    );
  }

  FutureOr<void> _onSetWorkPlanNotRealized(SetWorkPlanNotRealized event, Emitter<WorkPlanState> emit) {
    workPlanShowNotRealized.value = !workPlanShowNotRealized.value;
    add(SearchInWorkPlanEvent(date: event.date, query: event.query));
  }
}
