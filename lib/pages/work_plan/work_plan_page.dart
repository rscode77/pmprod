import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pmprod/bloc/authentication_bloc.dart';
import 'package:pmprod/extensions/datetime_extension.dart';
import 'package:pmprod/extensions/sized_box_extension.dart';
import 'package:pmprod/generated/l10n.dart';
import 'package:pmprod/pages/work_plan/bloc/work_plan_bloc.dart';
import 'package:pmprod/pages/work_plan/work_plan_part_list.dart';
import 'package:pmprod/routing/routing.dart';
import 'package:pmprod/styles/app_dimensions.dart';
import 'package:pmprod/styles/app_text_styles.dart';
import 'package:pmprod/widgets/action_button.dart';
import 'package:pmprod/widgets/data_text_field.dart';

class WorkPlanPage extends StatefulWidget {
  const WorkPlanPage({super.key});

  @override
  State<WorkPlanPage> createState() => _WorkPlanPageState();
}

class _WorkPlanPageState extends State<WorkPlanPage> {
  late final AuthenticationBloc _authenticationBloc;
  late final WorkPlanBloc _workPlanBloc;

  String get _selectedDate => _workPlanBloc.selectedDate.value.getOnlyDate;

  @override
  void initState() {
    super.initState();
    _authenticationBloc = context.read<AuthenticationBloc>();
    _workPlanBloc = context.read<WorkPlanBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: MultiBlocListener(
          listeners: [
            BlocListener<WorkPlanBloc, WorkPlanState>(listener: _workPlanListener),
            BlocListener<AuthenticationBloc, AuthenticationState>(listener: _loginListener),
          ],
          child: BlocBuilder<WorkPlanBloc, WorkPlanState>(
            builder: (context, state) {
              return _buildBody(state);
            },
          ),
        ),
      ),
    );
  }

  void _workPlanListener(BuildContext context, WorkPlanState state) {}

  void _loginListener(BuildContext context, AuthenticationState state) {
    if (state is LoginInitial) {
      Navigator.of(context).pushNamedAndRemoveUntil(
        Routing.login,
        (route) => false,
      );
    }
  }

  Future _buildBottomSheet() {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppDimensions.defaultRadius),
        ),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(AppDimensions.defaultPadding),
          height: 240,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: _buildBottomSheetItems(),
          ),
        );
      },
    );
  }

  List<Widget> _buildBottomSheetItems() {
    final TextEditingController dataController = TextEditingController(text: _selectedDate);
    return [
      Text(
        S.of(context).settings,
        style: AppTextStyles.title(),
      ),
      const Space.vertical(4.0),
      Text(
        S.of(context).selectDatePlan,
        style: AppTextStyles.info(),
      ),
      const Space.vertical(6.0),
      DataTextField(
        controller: dataController,
        isReadOnly: true,
        hintText: null,
        onTap: () async => await _showDatePicker(),
      ),
      const Spacer(),
      Text(
        S.of(context).logoutUser,
        style: AppTextStyles.info(),
      ),
      const Space.vertical(6.0),
      ActionButton(
        title: S.of(context).logout,
        onPressed: () => _logoutUser(),
      ),
    ];
  }

  Future<void> _showDatePicker() async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 1),
      lastDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 14),
    );
    if(selectedDate == null || _selectedDate == selectedDate.getOnlyDate) return;
    _updateSelectedDate(selectedDate);
  }

  void _updateSelectedDate(DateTime selectedDate) {
    _workPlanBloc.add(UpdateSelectedDateEvent(date: selectedDate));
    Navigator.pop(context);
  }

  void _logoutUser() {
    _authenticationBloc.add(
      const LogoutUserEvent(),
    );
    Navigator.pushNamedAndRemoveUntil(
      context,
      Routing.login,
      (route) => false,
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      centerTitle: true,
      titleTextStyle: AppTextStyles.appBar(),
      title: ValueListenableBuilder<DateTime>(
        valueListenable: _workPlanBloc.selectedDate,
        builder: (_, selectedDate, __) {
          return Text('${S.of(context).workPlan} ${selectedDate.getOnlyDate}');
        },
      ),
      leading: IconButton(
        icon: const Icon(Icons.settings),
        onPressed: () async => await _buildBottomSheet(),
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
            _workPlanBloc.add(SearchInWorkPlanEvent(query: query));
          }),
    );
  }

  Widget _buildError(WorkPlanFailed state) {
    return const Center(
      child: Text('Error'),
    );
  }
}
