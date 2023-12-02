import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:pmprod/networking/models/part_details_model.dart';

part 'work_plan_event.dart';

part 'work_plan_state.dart';

class WorkPlanBloc extends Bloc<WorkPlanEvent, WorkPlanState> {
  WorkPlanBloc() : super(WorkPlanInitial()) {
    on<WorkPlanInitialEvent>(_onWorkPlanInitialEvent);
    on<LoadWorkPlanEvent>(_onLoadWorkPlanEvent);
  }

  void _onWorkPlanInitialEvent(WorkPlanInitialEvent event, Emitter<WorkPlanState> emit) {
    emit(WorkPlanLoading());
    add(LoadWorkPlanEvent(date: DateTime.now()));
  }

  Future<void> _onLoadWorkPlanEvent(LoadWorkPlanEvent event, Emitter<WorkPlanState> emit) async {
    final String workPlanFile = await rootBundle.loadString('assets/mocks/mock.json');

    final List partDetailsModelList = jsonDecode(workPlanFile) as List;

    var parts = partDetailsModelList.map((jsonItem) => PartDetailModel.fromJson(jsonItem)).toList();
    return emit(WorkPlanLoaded(parts));
    emit(const WorkPlanFailed(message: 'Error'));
  }
}
