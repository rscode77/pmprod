import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pmprod/bloc/authentication_bloc.dart';
import 'package:pmprod/extensions/string_extension.dart';
import 'package:pmprod/generated/l10n.dart';
import 'package:pmprod/networking/models/part_statuses_model.dart';
import 'package:pmprod/pages/part_details/bloc/part_details_bloc.dart';
import 'package:pmprod/pages/part_details/tabs/draw_tab.dart';
import 'package:pmprod/pages/part_details/tabs/realization_tab.dart';
import 'package:pmprod/pages/part_details/tabs/status_tab.dart';
import 'package:pmprod/styles/app_colors.dart';
import 'package:pmprod/widgets/custom_snack_bar.dart';

class PartDetailPage extends StatefulWidget {
  const PartDetailPage({super.key});

  @override
  State<PartDetailPage> createState() => _PartDetailPageState();
}

class _PartDetailPageState extends State<PartDetailPage> {
  late final AuthenticationBloc _authenticationBloc;
  late final PartDetailBloc _partDetailBloc;

  final PageController _pageController = PageController();

  String get _loggedInUsername => (_authenticationBloc.state as LoginSuccess).username.orEmpty();

  @override
  initState() {
    super.initState();
    _authenticationBloc = context.read<AuthenticationBloc>();
    _partDetailBloc = context.read<PartDetailBloc>()..add(LoadPartOrderStatuses());
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(),
        body: SafeArea(
          child: BlocListener<PartDetailBloc, PartDetailsState>(
            listener: _partDetailListener,
            child: _buildBody(),
          ),
        ),
      ),
    );
  }

  void _partDetailListener(BuildContext context, PartDetailsState state) {
    if (state is PartMissingQuantityReported) {
      if (state.success) {
        CustomSnackBar(
          context: context,
          message: S.of(context).missingPartsReported,
          type: SnackBarType.success,
        ).showSnackBar();
      }
      if (!state.success) {
        CustomSnackBar(
          context: context,
          message: S.of(context).missingPartsReportedFaild,
          type: SnackBarType.error,
        ).showSnackBar();
      }
    }
    if (state is PartDetailLoaded) {
      setState(() {
        _partDetailBloc.selectedPart = state.selectedPart;
      });
    }
    if (state is PartUpdateQuantity) {
      if (state.success) {
        CustomSnackBar(
          context: context,
          message: S.of(context).partQuantityUpdated,
          type: SnackBarType.success,
        ).showSnackBar();
      }
      if (!state.success) {
        CustomSnackBar(
          context: context,
          message: S.of(context).partQuantityUpdatedFaild,
          type: SnackBarType.error,
        ).showSnackBar();
      }
    }
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(_partDetailBloc.selectedPart.partName),
      bottom: TabBar(
        indicatorColor: AppColors.orange,
        labelColor: AppColors.orange,
        unselectedLabelColor: AppColors.grey400,
        dividerColor: AppColors.grey,
        indicator: const BoxDecoration(
          color: AppColors.grey,
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        },
        isScrollable: false,
        physics: const NeverScrollableScrollPhysics(),
        tabs: const [
          Tab(icon: Icon(Icons.photo)),
          Tab(icon: Icon(Icons.check_rounded)),
          Tab(icon: Icon(Icons.account_tree_rounded)),
        ],
      ),
    );
  }

  PageView _buildBody() {
    return PageView(
      controller: _pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        DrawTab(
          draw: _partDetailBloc.selectedPart.draw,
        ),
        RealizationTab(
          username: _loggedInUsername,
          partDetail: _partDetailBloc.selectedPart,
        ),
        ValueListenableBuilder(
          valueListenable: _partDetailBloc.partStatuses,
          builder: (_, List<PartStatusesModel> partStatuses, __) {
            return StatusTab(partOrderStatuses: partStatuses);
          },
        ),
      ],
    );
  }
}
