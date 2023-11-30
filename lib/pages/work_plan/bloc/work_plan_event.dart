part of 'work_plan_bloc.dart';

abstract class WorkPlanEvent extends Equatable {
  const WorkPlanEvent();
}

class WorkPlanInitialEvent extends WorkPlanEvent {
  const WorkPlanInitialEvent();

  @override
  List<Object?> get props => [];
}

class LoadWorkPlanEvent extends WorkPlanEvent {
  final DateTime date;

  const LoadWorkPlanEvent({
    required this.date,
  });

  @override
  List<Object?> get props => [date];
}
