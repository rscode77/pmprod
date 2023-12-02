import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pmprod/pages/part_details/bloc/part_details_bloc.dart';
import 'package:pmprod/pages/part_details/tabs/draw_tab.dart';
import 'package:pmprod/pages/part_details/tabs/realization_tab.dart';
import 'package:pmprod/pages/part_details/tabs/status_tab.dart';

class PartDetailPage extends StatefulWidget {
  const PartDetailPage({super.key});

  @override
  State<PartDetailPage> createState() => _PartDetailPageState();
}

class _PartDetailPageState extends State<PartDetailPage> {
  late final PartDetailBloc bloc;

  @override
  initState() {
    super.initState();
    bloc = context.read<PartDetailBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: _buildAppBar(),
        body: SafeArea(
          child: _buildBody(),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(bloc.selectedPart.partName),
      bottom: const TabBar(
        tabs: [
          Tab(icon: Icon(Icons.directions_car)),
          Tab(icon: Icon(Icons.directions_transit)),
          Tab(icon: Icon(Icons.directions_bike)),
        ],
      ),
    );
  }

  TabBarView _buildBody() {
    return TabBarView(
      children: [
        const DrawTab(),
        RealizationTab(partDetail: bloc.selectedPart),
        const StatusTab(),
      ],
    );
  }
}
