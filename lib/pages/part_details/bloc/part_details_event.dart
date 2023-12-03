part of 'part_details_bloc.dart';

abstract class PartDetailsEvent extends Equatable {
  const PartDetailsEvent();
}

class PartDetailsInitialEvent extends PartDetailsEvent {
  @override
  List<Object?> get props => [];
}

class UpdateQuantityEvent extends PartDetailsEvent {
  final int quantity;

  const UpdateQuantityEvent({required this.quantity});

  @override
  List<Object?> get props => [quantity];
}

class ReportMissingPartEvent extends PartDetailsEvent {
  final int partUniqueId;
  final int quantity;

  const ReportMissingPartEvent({
    required this.partUniqueId,
    required this.quantity,
  });

  @override
  List<Object?> get props => [
        partUniqueId,
        quantity,
      ];
}
