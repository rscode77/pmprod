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

class LoadOrderEvent extends WorkPlanEvent {
  final String order;

  const LoadOrderEvent({
    required this.order,
  });

  @override
  List<Object?> get props => [order];
}

class UpdateSelectedDateEvent extends WorkPlanEvent {
  final DateTime date;

  const UpdateSelectedDateEvent({
    required this.date,
  });

  @override
  List<Object?> get props => [date];
}

class SearchInWorkPlanEvent extends WorkPlanEvent {
  final DateTime date;
  final String query;

  const SearchInWorkPlanEvent({
    required this.date,
    required this.query,
  });

  @override
  List<Object?> get props => [
        date,
        query,
      ];
}

class UpdateWorkPlanQuantity extends WorkPlanEvent {
  final int quantity;
  final int partUniqueId;

  const UpdateWorkPlanQuantity({
    required this.quantity,
    required this.partUniqueId,
  });

  @override
  List<Object?> get props => [
        quantity,
        partUniqueId,
      ];
}

class SetWorkPlanNotRealized extends WorkPlanEvent {
  final DateTime date;
  final String query;

  const SetWorkPlanNotRealized({
    required this.date,
    required this.query,
  });

  @override
  List<Object?> get props => [date, query];
}
