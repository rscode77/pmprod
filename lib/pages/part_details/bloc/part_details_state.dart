part of 'part_details_bloc.dart';

abstract class PartDetailsState extends Equatable {
  const PartDetailsState();
}

class PartDetailsInitial extends PartDetailsState {
  @override
  List<Object> get props => [];
}

class PartMissingQuantityLoading extends PartDetailsState {
  @override
  List<Object> get props => [];
}

class PartMissingQuantityReported extends PartDetailsState {
  final bool success;

  const PartMissingQuantityReported({required this.success});

  @override
  List<Object> get props => [success];
}

class PartUpdateQuantityLoading extends PartDetailsState {
  @override
  List<Object> get props => [];
}

class PartDetailLoaded extends PartDetailsState {
  final PartDetailModel selectedPart;

  const PartDetailLoaded({required this.selectedPart});

  @override
  List<Object> get props => [selectedPart];
}

class PartUpdateQuantity extends PartDetailsState {
  final bool success;

  const PartUpdateQuantity({
    required this.success,
  });

  @override
  List<Object> get props => [success];
}

class PartOrderStatusesLoading extends PartDetailsState {
  @override
  List<Object> get props => [];
}

class PartOrderStatusesLoaded extends PartDetailsState {
  final bool success;

  const PartOrderStatusesLoaded({
    required this.success,
  });

  @override
  List<Object> get props => [
        success,
      ];
}
