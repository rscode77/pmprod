import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:pmprod/extensions/datetime_extension.dart';
import 'package:pmprod/extensions/list_product_details_extension.dart';
import 'package:pmprod/extensions/response_extension.dart';
import 'package:pmprod/extensions/string_extension.dart';
import 'package:pmprod/networking/models/part_details_model.dart';
import 'package:pmprod/repositories/work_plan_repository.dart';

part 'work_plan_event.dart';

part 'work_plan_state.dart';

class WorkPlanBloc extends Bloc<WorkPlanEvent, WorkPlanState> {
  final WorkPlanRepository workPlanRepository;

  WorkPlanBloc({required this.workPlanRepository}) : super(const WorkPlanInitial([])) {
    on<WorkPlanInitialEvent>(_onWorkPlanInitialEvent);
    on<LoadOrderEvent>(_onLoadOrderEvent);
    on<LoadWorkPlanEvent>(_onLoadWorkPlanEvent);
    on<UpdateSelectedDateEvent>(_onUpdateSelectedDateEvent);
    on<SearchInWorkPlanEvent>(_onSearchInWorkPlanEvent);
  }

  List<PartDetailModel> workPlan = [];

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
    if (event.query.isBlank) return;
    final List<PartDetailModel> filteredParts = workPlan.filterByQuery(query: event.query);
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
}
