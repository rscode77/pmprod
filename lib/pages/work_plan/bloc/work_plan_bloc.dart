import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:pmprod/extensions/list_product_details_extension.dart';
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
    emit(WorkPlanLoading());
    await Future.delayed(const Duration(seconds: 1));
    final String workPlanFile = await rootBundle.loadString('assets/mocks/mock.json');

    final List partDetailsModelList = jsonDecode(workPlanFile) as List;

    final List<PartDetailModel> parts =
        partDetailsModelList.map((jsonItem) => PartDetailModel.fromJson(jsonItem)).toList();

    workPlan = parts;

    return emit(WorkPlanLoaded(parts));
  }

  void _onUpdateSelectedDateEvent(UpdateSelectedDateEvent event, Emitter<WorkPlanState> emit) {
    print(event.date);
    selectedDate.value = event.date;
    add(LoadWorkPlanEvent(date: event.date));
  }

  void _onSearchInWorkPlanEvent(SearchInWorkPlanEvent event, Emitter<WorkPlanState> emit) {
    if (event.query.isBlank) return emit(WorkPlanLoaded(workPlan));
    final List<PartDetailModel> filteredParts = workPlan.filterByQuery(query: event.query);
    emit(WorkPlanLoaded(filteredParts));
  }
}
