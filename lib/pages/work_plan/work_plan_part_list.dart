import 'package:flutter/material.dart';
import 'package:pmprod/extensions/sized_box_extension.dart';
import 'package:pmprod/generated/l10n.dart';
import 'package:pmprod/networking/models/part_details_model.dart';
import 'package:pmprod/styles/app_decoration.dart';
import 'package:pmprod/styles/app_dimensions.dart';

class WorkPlanPartList extends StatefulWidget {
  final Function(PartDetailModel) onPartPressed;
  final List<PartDetailModel> partTabList;

  const WorkPlanPartList({
    super.key,
    required this.onPartPressed,
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
            _buildImageSection(),
            const Space.vertical(8.0),
            Row(
              children: [
                _buildStatusIcon(),
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

  Widget _buildStatusIcon() {
    return Row(
      children: [
        Icon(
          Icons.check_circle,
          size: AppDimensions.height.iconSize,
        ),
      ],
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
              Text(mainOrder),
              Text(productionOrder),
              Text(partName),
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
        Text('$realizedQuantity/$orderQuantity'),
      ],
    );
  }
}
