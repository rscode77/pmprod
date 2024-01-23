import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:pmprod/extensions/datetime_extension.dart';
import 'package:pmprod/extensions/sized_box_extension.dart';
import 'package:pmprod/extensions/string_extension.dart';
import 'package:pmprod/generated/l10n.dart';
import 'package:pmprod/mapper/part_detail_mapper.dart';
import 'package:pmprod/networking/models/part_details_model.dart';
import 'package:pmprod/networking/models/production_order_model.dart';
import 'package:pmprod/pages/part_in_progress/bloc/part_in_progress_bloc.dart';
import 'package:pmprod/pages/work_plan/bloc/work_plan_bloc.dart';
import 'package:pmprod/routing/routing.dart';
import 'package:pmprod/styles/app_decoration.dart';
import 'package:pmprod/styles/app_dimensions.dart';
import 'package:pmprod/styles/app_text_styles.dart';
import 'package:pmprod/widgets/action_button.dart';
import 'package:pmprod/widgets/part_quantity.dart';
import 'package:pmprod/widgets/show_pdf.dart';

class PartInProgressPage extends StatefulWidget {
  const PartInProgressPage({super.key});

  @override
  State<PartInProgressPage> createState() => _PartInProgressPageState();
}

class _PartInProgressPageState extends State<PartInProgressPage> {
  late final PartInProgressBloc _partInProgressBloc;

  @override
  void initState() {
    _partInProgressBloc = context.read<PartInProgressBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            StreamBuilder<List<ProductionOrderModel>>(
              stream: _partInProgressBloc.productionOrdersStream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(
                    child: Text(S.of(context).noStartedOrders),
                  );
                } else {
                  final productionOrders = snapshot.data!;
                  return Expanded(
                    child: ListView.builder(
                      itemCount: productionOrders.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _buildPartTabListElement(part: productionOrders[index]);
                      },
                    ),
                  );
                }
              },
            ),
            _buildBackButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildPartTabListElement({required ProductionOrderModel part}) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(
        Routing.partDetail,
        arguments: mapProductionOrderToPartDetail(part),
      ),
      child: Container(
        decoration: AppDecoration.workPlanItemDecoration(),
        padding: const EdgeInsets.only(
          top: AppDimensions.defaultPadding,
          bottom: AppDimensions.defaultPadding,
          left: AppDimensions.defaultPadding,
        ),
        margin: EdgeInsets.all(AppDimensions.margin.partDetailsListMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Space.vertical(8.0),
            _buildImageSection(part.draw),
            const Space.vertical(24.0),
            _buildContractorName(part.contractor),
            const Space.vertical(2.0),
            _buildOperatorData(
              operator: part.operator,
              time: DateTime.fromMicrosecondsSinceEpoch(part.timestamp * 1000).getDateWithTime,
            ),
            const Space.vertical(4.0),
            Row(
              children: [
                _buildDetailsSection(
                  mainOrder: part.mainOrder,
                  productionOrder: part.productionOrder,
                  partName: part.partName,
                  material: part.material,
                ),
                const Spacer(),
                PartQuantityWidget(
                  orderQuantity: part.quantity.toInt(),
                  realizedQuantity: part.realizedQuantity.toInt(),
                ),
                const Space.horizontal(16.0),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ActionButton(
        title: S.of(context).back,
        onPressed: () => Navigator.pop(context),
      ),
    );
  }

  Widget _buildContractorName(String contractor) {
    return Row(
      children: [
        Text(
          contractor,
          style: AppTextStyles.title(),
        ),
      ],
    );
  }

  Widget _buildOperatorData({
    required String operator,
    required String time,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          operator,
          style: AppTextStyles.title(),
        ),
        Text(
          time,
          style: AppTextStyles.title(),
        ),
      ],
    );
  }

  Widget _buildImageSection(String? draw) {
    if (draw == null) return const SizedBox.shrink();
    return SizedBox(
      height: AppDimensions.height.partDrawHeight,
      width: double.infinity,
      child: ShowPdf(
        fitPolicy: FitPolicy.BOTH,
        pdf: draw,
      ),
    );
  }

  Widget _buildDetailsSection({
    required String mainOrder,
    required String productionOrder,
    required String partName,
    required String material,
  }) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              mainOrder,
              style: AppTextStyles.info(),
            ),
            Text(
              productionOrder,
              style: AppTextStyles.info(),
            ),
            Text(
              material,
              style: AppTextStyles.info(),
            ),
            Text(
              partName.length > 32 ? '${partName.substring(0, 32)}...' : partName,
              style: AppTextStyles.info(),
            ),
          ],
        ),
      ],
    );
  }
}
