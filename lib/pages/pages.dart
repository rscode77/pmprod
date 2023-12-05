import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pmprod/networking/models/part_details_model.dart';
import 'package:pmprod/pages/login/login_page.dart';
import 'package:pmprod/pages/part_details/bloc/part_details_bloc.dart';
import 'package:pmprod/pages/part_details/part_detail_page.dart';
import 'package:pmprod/pages/work_plan/bloc/work_plan_bloc.dart';
import 'package:pmprod/pages/work_plan/work_plan_page.dart';

abstract class Pages {
  static Widget login() {
    return const LoginPage();
  }

  static Widget partDetail(dynamic arguments) {
    return BlocProvider<PartDetailBloc>(
      create: (context) => PartDetailBloc(selectedPart: arguments as PartDetailModel),
      child: const PartDetailPage(),
    );
  }

  static Widget workPlan() {
    return BlocProvider<WorkPlanBloc>(
      create: (context) => WorkPlanBloc()..add(const WorkPlanInitialEvent()),
      child: const WorkPlanPage(),
    );
  }
}
