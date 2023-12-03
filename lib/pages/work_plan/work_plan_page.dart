import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pmprod/extensions/datetime_extension.dart';
import 'package:pmprod/generated/l10n.dart';
import 'package:pmprod/pages/work_plan/bloc/work_plan_bloc.dart';
import 'package:pmprod/pages/work_plan/work_plan_part_list.dart';
import 'package:pmprod/routing/routing.dart';

class WorkPlanPage extends StatefulWidget {
  const WorkPlanPage({super.key});

  @override
  State<WorkPlanPage> createState() => _WorkPlanPageState();
}

class _WorkPlanPageState extends State<WorkPlanPage> {
  late final WorkPlanBloc workPlanBloc;

  String get selectedDate => workPlanBloc.selectedDate.value.getOnlyDate;

  @override
  void initState() {
    workPlanBloc = context.read<WorkPlanBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: BlocConsumer<WorkPlanBloc, WorkPlanState>(
          listener: _workPlanListener,
          builder: (context, state) {
            return _buildBody(state);
          },
        ),
      ),
    );
  }

  void _workPlanListener(BuildContext context, WorkPlanState state) {}

  AppBar _buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: Text('${S.of(context).workPlan} $selectedDate'),
      leading: IconButton(
        icon: const Icon(Icons.settings),
        onPressed: () {},
      ),
    );
  }

  Widget _buildBody(WorkPlanState state) {
    if (state is WorkPlanLoading) return _buildLoading();
    if (state is WorkPlanLoaded) return _buildPartList(state);
    if (state is WorkPlanFailed) return _buildError(state);
    return const SizedBox.shrink();
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildPartList(WorkPlanLoaded state) {
    return Center(
      child: WorkPlanPartList(
          partTabList: state.workPlan,
          onPartPressed: (part) => Navigator.of(context).pushNamed(
                Routing.partDetail,
                arguments: part,
              ),
          onSearchChanged: (String query) {
            workPlanBloc.add(SearchInWorkPlanEvent(query: query));
          }),
    );
  }

  Widget _buildError(WorkPlanFailed state) {
    return const Center(
      child: Text('Error'),
    );
  }
}
