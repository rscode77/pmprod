part of 'part_details_bloc.dart';

abstract class PartDetailsEvent extends Equatable {
  const PartDetailsEvent();
}

class PartDetailsInitialEvent extends PartDetailsEvent {
  @override
  List<Object?> get props => [];
}

class UpdateQuantityEvent extends PartDetailsEvent {
  final String username;
  final int quantity;

  const UpdateQuantityEvent({
    required this.username,
    required this.quantity,
  });

  @override
  List<Object?> get props => [quantity,username];
}

class ReportMissingPartEvent extends PartDetailsEvent {
  final int quantity;
  final String reportingPerson;

  const ReportMissingPartEvent({
    required this.reportingPerson,
    required this.quantity,
  });

  @override
  List<Object?> get props => [
        reportingPerson,
        quantity,
      ];
}

class LoadPartOrderStatuses extends PartDetailsEvent {
  @override
  List<Object?> get props => [];
}
