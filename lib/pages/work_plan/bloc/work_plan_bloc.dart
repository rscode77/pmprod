import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:pmprod/extensions/string_extension.dart';
import 'package:pmprod/networking/models/part_details_model.dart';

part 'work_plan_event.dart';

part 'work_plan_state.dart';

class WorkPlanBloc extends Bloc<WorkPlanEvent, WorkPlanState> {
  WorkPlanBloc() : super(const WorkPlanInitial([])) {
    on<WorkPlanInitialEvent>(_onWorkPlanInitialEvent);
    on<LoadWorkPlanEvent>(_onLoadWorkPlanEvent);
    on<UpdateSelectedDateEvent>(_onUpdateSelectedDateEvent);
    on<SearchInWorkPlanEvent>(_onSearchInWorkPlanEvent);
  }

  ValueNotifier<DateTime> selectedDate = ValueNotifier<DateTime>(DateTime.now());

  List<PartDetailModel> workPlan = [];

  void _onWorkPlanInitialEvent(WorkPlanInitialEvent event, Emitter<WorkPlanState> emit) {
    emit(WorkPlanLoading());
    add(LoadWorkPlanEvent(date: DateTime.now()));
  }

  Future<void> _onLoadWorkPlanEvent(LoadWorkPlanEvent event, Emitter<WorkPlanState> emit) async {
    final String workPlanFile = await rootBundle.loadString('assets/mocks/mock.json');

    final List partDetailsModelList = jsonDecode(workPlanFile) as List;

    final List<PartDetailModel> parts =
        partDetailsModelList.map((jsonItem) => PartDetailModel.fromJson(jsonItem)).toList();

    workPlan = parts;

    return emit(WorkPlanLoaded(parts));
  }

  void _onUpdateSelectedDateEvent(UpdateSelectedDateEvent event, Emitter<WorkPlanState> emit) {
    selectedDate.value = event.date;
  }

  void _onSearchInWorkPlanEvent(SearchInWorkPlanEvent event, Emitter<WorkPlanState> emit) {
    final String query = event.query.toLowerCase();

    if (event.query.isBlank) return emit(WorkPlanLoaded(workPlan));
    final List<PartDetailModel> filteredParts = workPlan.where((part) {
      final String partName = part.partName.toLowerCase();
      final String contractor = part.contractor.toLowerCase();
      final String mainOrder = part.mainOrder.toLowerCase();
      final String productionOrder = part.productionOrder.toLowerCase();
      final String material = part.material.toLowerCase();

      return partName.contains(query) ||
          contractor.contains(query) ||
          mainOrder.contains(query) ||
          productionOrder.contains(query) ||
          material.contains(query);
    }).toList();
    emit(WorkPlanLoaded(filteredParts));
  }
}
