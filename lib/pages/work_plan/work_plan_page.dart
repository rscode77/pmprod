import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pmprod/bloc/authentication_bloc.dart';
import 'package:pmprod/extensions/sized_box_extension.dart';
import 'package:pmprod/extensions/string_extension.dart';
import 'package:pmprod/pages/work_plan/bloc/work_plan_bloc.dart';
import 'package:pmprod/pages/work_plan/work_plan_bottomsheet.dart';
import 'package:pmprod/pages/work_plan/work_plan_part_list.dart';
import 'package:pmprod/routing/routing.dart';
import 'package:pmprod/styles/app_colors.dart';
import 'package:pmprod/styles/app_dimensions.dart';
import 'package:pmprod/widgets/load_order_dialog.dart';

class WorkPlanPage extends StatefulWidget {
  const WorkPlanPage({super.key});

  @override
  State<WorkPlanPage> createState() => _WorkPlanPageState();
}

class _WorkPlanPageState extends State<WorkPlanPage> {
  final TextEditingController _searchController = TextEditingController();

  late final AuthenticationBloc _authenticationBloc;
  late final WorkPlanBloc _workPlanBloc;

  String? get _loggedInUsername {
    if (_authenticationBloc.state is LoginSuccess) {
      return (_authenticationBloc.state as LoginSuccess).username;
    }
    return null;
  }

  DateTime? get _selectedDate {
    if (_workPlanBloc.state is WorkPlanLoaded) {
      return (_workPlanBloc.state as WorkPlanLoaded).selectedDate;
    }
    return null;
  }

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
            builder: (_, state) {
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
      backgroundColor: AppColors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppDimensions.defaultRadius),
        ),
      ),
      builder: (context) {
        return Container(
          color: AppColors.white,
          padding: const EdgeInsets.all(AppDimensions.defaultPadding),
          height: AppDimensions.height.bottomSheetHeight,
          child: _buildBottomSheetItems(),
        );
      },
    );
  }

  Widget _buildBottomSheetItems() {
    return WorkPlanBottomSheet(
      username: _loggedInUsername.orEmpty(),
      onLoadOrder: _onLoadOrder,
      onLogout: _logoutUser,
      onLoadWorkPlan: _onLoadWorkPlan,
      onNavigateToPartInProgress: _onNavigateToPartInProgress,
      selectedDate: _selectedDate ?? DateTime.now(),
    );
  }

  void _onLoadWorkPlan(DateTime selectedDate) {
    _workPlanBloc.add(UpdateSelectedDateEvent(date: selectedDate));
    Navigator.pop(context);
  }

  void _onLoadOrder() {
    String? order;
    showDialog(
      context: context,
      builder: (context) {
        return LoadOrderDialog(
          order: (orderValue) => order = orderValue,
        );
      },
    ).then(
      (value) {
        if (value == null) return;
        _workPlanBloc.add(
          LoadOrderEvent(
            order: order.orEmpty(),
          ),
        );
        Navigator.pop(context);
      },
    );
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
      backgroundColor: AppColors.white,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(
          Icons.menu_rounded,
          size: 25,
        ),
        onPressed: () async => await _buildBottomSheet(),
      ),
      actions: [
        ValueListenableBuilder(
          valueListenable: _workPlanBloc.workPlanShowNotRealized,
          builder: (context, value, _) => CupertinoSwitch(
            activeColor: AppColors.orange,
            value: value,
            onChanged: (value) {
              _workPlanBloc.add(
                SetWorkPlanNotRealized(
                  date: _selectedDate ?? DateTime.now(),
                  query: _searchController.text,
                ),
              );
            },
          ),
        ),
        const Space.horizontal(8.0),
      ],
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
      child: SizedBox(
        height: 50,
        width: 50,
        child: CircularProgressIndicator(
          color: AppColors.orange,
        ),
      ),
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
          _searchController.text = query;
          _workPlanBloc.add(
            SearchInWorkPlanEvent(
              query: query,
              date: _selectedDate ?? DateTime.now(),
            ),
          );
        },
      ),
    );
  }

  Widget _buildError(WorkPlanFailed state) {
    return const Center(
      child: Text('Error'),
    );
  }

  void _onNavigateToPartInProgress() {
    Navigator.pop(context);
    Navigator.of(context).pushNamed(
      Routing.partInProgress,
    );
  }
}
