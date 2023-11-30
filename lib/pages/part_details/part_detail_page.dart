import 'package:flutter/material.dart';
import 'package:pmprod/pages/bloc_page_state.dart';
import 'package:pmprod/pages/part_details/bloc/part_details_bloc.dart';
import 'package:pmprod/pages/part_details/tabs/part_list_tab.dart';

class PartDetailPage extends StatefulWidget {
  const PartDetailPage({super.key});

  @override
  State<PartDetailPage> createState() => _PartDetailPageState();
}

class _PartDetailPageState extends BlocPageState<PartDetailPage, PartDetailBloc> {
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
        const PartListTab(),
        _buildPartListTab(),
        _buildPartListTab(),
      ],
    );
  }

  Widget _buildPartListTab() {
    return Column(
      children: [

      ],
    );
  }
}
