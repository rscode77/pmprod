part of 'work_plan_bloc.dart';

abstract class WorkPlanState extends Equatable {
  const WorkPlanState();
}

class WorkPlanInitial extends WorkPlanState {
  final List<PartDetailModel> workPlan;

  const WorkPlanInitial(this.workPlan);

  @override
  List<Object> get props => [workPlan];
}

class WorkPlanLoading extends WorkPlanState {
  @override
  List<Object> get props => [];
}

class WorkPlanLoaded extends WorkPlanState {
  final List<PartDetailModel> workPlan;
  final DateTime selectedDate;

  const WorkPlanLoaded({
    required this.selectedDate,
    required this.workPlan,
  });

  @override
  List<Object> get props => [
        selectedDate,
        workPlan,
      ];
}

class WorkPlanFailed extends WorkPlanState {
  final String message;

  const WorkPlanFailed({required this.message});

  @override
  List<Object> get props => [message];
}