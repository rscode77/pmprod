import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:pmprod/extensions/sized_box_extension.dart';
import 'package:pmprod/generated/l10n.dart';
import 'package:pmprod/networking/models/part_details_model.dart';
import 'package:pmprod/styles/app_colors.dart';
import 'package:pmprod/styles/app_decoration.dart';
import 'package:pmprod/styles/app_dimensions.dart';
import 'package:pmprod/styles/app_text_styles.dart';
import 'package:pmprod/widgets/part_quantity.dart';
import 'package:pmprod/widgets/show_pdf.dart';

class WorkPlanPartList extends StatefulWidget {
  final Function(PartDetailModel) onPartPressed;
  final Function(String) onSearchChanged;
  final List<PartDetailModel> partTabList;

  const WorkPlanPartList({
    super.key,
    required this.onPartPressed,
    required this.onSearchChanged,
    required this.partTabList,
  });

  @override
  State<WorkPlanPartList> createState() => _WorkPlanPartListState();
}

class _WorkPlanPartListState extends State<WorkPlanPartList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildSearchBar(),
        Expanded(
          child: ListView.builder(
            key: UniqueKey(),
            shrinkWrap: true,
            itemCount: widget.partTabList.length,
            itemBuilder: (_, index) {
              return _buildPartTabListElement(part: widget.partTabList[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      decoration: AppDecoration.searchBarDecoration(),
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.defaultPadding,
      ),
      margin: EdgeInsets.all(AppDimensions.margin.partDetailsListMargin),
      child: Row(
        children: [
          const Icon(
            Icons.search_rounded,
            color: AppColors.blackPrimary,
          ),
          const Space.horizontal(8.0),
          Expanded(
            child: TextField(
              style: AppTextStyles.textField(),
              onChanged: (value) => widget.onSearchChanged(value),
              decoration: InputDecoration(
                hintText: S.of(context).search,
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPartTabListElement({required PartDetailModel part}) {
    return InkWell(
      onTap: () => widget.onPartPressed(part),
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

  Widget _buildContractorName(String contractor) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            contractor,
            style: AppTextStyles.title(),
          ),
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
