import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pmprod/networking/models/part_details_model.dart';
import 'package:pmprod/pages/login/login_page.dart';
import 'package:pmprod/pages/part_details/bloc/part_details_bloc.dart';
import 'package:pmprod/pages/part_details/part_detail_page.dart';
import 'package:pmprod/pages/part_in_progress/bloc/part_in_progress_bloc.dart';
import 'package:pmprod/pages/part_in_progress/part_in_progress_page.dart';
import 'package:pmprod/pages/work_plan/work_plan_page.dart';
import 'package:pmprod/repositories/part_operations_repository.dart';
import 'package:pmprod/repositories/prodiction_order_repository.dart';

abstract class Pages {
  static Widget login() {
    return const LoginPage();
  }

  static Widget partDetail(dynamic arguments) {
    return BlocProvider<PartDetailBloc>(
      create: (context) => PartDetailBloc(
        selectedPart: arguments as PartDetailModel,
        authenticationBloc: BlocProvider.of(context),
        workPlanBloc: BlocProvider.of(context),
        partOperationsRepository: GetIt.instance.get<PartOperationsRepository>(),
        productionOrderRepository: GetIt.instance.get<ProductionOrderRepository>(),
      ),
      child: const PartDetailPage(),
    );
  }

  static Widget workPlan() {
    return const WorkPlanPage();
  }

  static Widget partInProgress() {
    return BlocProvider<PartInProgressBloc>(
      create: (context) => PartInProgressBloc(
        productionOrderRepository: GetIt.instance.get<ProductionOrderRepository>(),
      ),
      child: const PartInProgressPage(),
    );
  }
}
