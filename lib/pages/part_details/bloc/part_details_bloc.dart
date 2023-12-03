import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pmprod/networking/models/part_details_model.dart';

part 'part_details_event.dart';
part 'part_details_state.dart';

class PartDetailBloc extends Bloc<PartDetailsEvent, PartDetailsState> {
  final PartDetailModel selectedPart;

  PartDetailBloc({required this.selectedPart}) : super(PartDetailsInitial()) {
    on<UpdateQuantityEvent>(_onUpdateQuantityEvent);
    on<ReportMissingPartEvent>(_onReportMissingPartEvent);
  }

  void _onUpdateQuantityEvent(UpdateQuantityEvent event, Emitter<PartDetailsState> emit) {
    print(event.quantity);
  }

  void _onReportMissingPartEvent(ReportMissingPartEvent event, Emitter<PartDetailsState> emit) {
    print(event.partUniqueId);
    print(event.quantity);
  }
}
