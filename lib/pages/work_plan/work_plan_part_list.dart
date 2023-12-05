import 'package:flutter/material.dart';
import 'package:pmprod/extensions/sized_box_extension.dart';
import 'package:pmprod/generated/l10n.dart';
import 'package:pmprod/networking/models/part_details_model.dart';
import 'package:pmprod/styles/app_decoration.dart';
import 'package:pmprod/styles/app_dimensions.dart';
import 'package:pmprod/styles/app_text_styles.dart';

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
      decoration: AppDecoration.boxDecoration(),
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.defaultPadding,
      ),
      margin: EdgeInsets.all(AppDimensions.margin.partDetailsListMargin),
      child: TextField(
        style: AppTextStyles.textField(),
        onChanged: (value) => widget.onSearchChanged(value),
        decoration: InputDecoration(
          hintText: S.of(context).search,
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildPartTabListElement({required PartDetailModel part}) {
    return InkWell(
      onTap: () => widget.onPartPressed(part),
      child: Container(
        decoration: AppDecoration.boxDecoration(),
        padding: const EdgeInsets.all(AppDimensions.defaultPadding),
        margin: EdgeInsets.all(AppDimensions.margin.partDetailsListMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildContractorName(part.contractor),
            _buildImageSection(),
            const Space.vertical(8.0),
            Row(
              children: [
                _buildStatusIcon(
                  quantity: part.quantity,
                  realizedQuantity: part.realizedQuantity,
                ),
                _buildDetailsSection(
                  mainOrder: part.mainOrder,
                  productionOrder: part.productionOrder,
                  partName: part.partName,
                ),
                const Spacer(),
                _buildPartQuantity(
                  orderQuantity: part.quantity.toInt(),
                  realizedQuantity: part.realizedQuantity.toInt(),
                ),
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

  Widget _buildImageSection() {
    return SizedBox(
      height: AppDimensions.height.partDrawHeight,
      width: double.infinity,
      child: Image.network(
        'https://cdn.cadcrowd.com/3d-models/f8/f3/f8f39fbc-f099-4f09-b95e-bd7b289b7897/gallery/8b778e33-56e5-460c-ae2f-42a63c4cfede/medium.jpg',
        fit: BoxFit.fitHeight,
      ),
    );
  }

  Widget _buildDetailsSection({
    required String mainOrder,
    required String productionOrder,
    required String partName,
  }) {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppDimensions.defaultPadding,
      ),
      child: Row(
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
                partName,
                style: AppTextStyles.info(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPartQuantity({
    required int orderQuantity,
    required int realizedQuantity,
  }) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: AppDimensions.defaultPadding),
          child: Text(
            '$realizedQuantity/$orderQuantity',
            style: AppTextStyles.title(),
          ),
        ),
      ],
    );
  }

  Widget _buildStatusIcon({
    required quantity,
    required realizedQuantity,
  }) {
    if (quantity >= realizedQuantity) {
      return Icon(
        Icons.circle_outlined,
        size: AppDimensions.height.iconSize,
      );
    } else if (realizedQuantity > 0) {
      return Icon(
        Icons.build_circle_rounded,
        size: AppDimensions.height.iconSize,
      );
    }
    return Icon(
      Icons.check_circle_rounded,
      size: AppDimensions.height.iconSize,
    );
  }
}
