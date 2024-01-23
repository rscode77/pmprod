import 'package:flutter/material.dart';
import 'package:pmprod/extensions/datetime_extension.dart';
import 'package:pmprod/extensions/sized_box_extension.dart';
import 'package:pmprod/extensions/string_extension.dart';
import 'package:pmprod/networking/models/part_statuses_model.dart';
import 'package:pmprod/styles/app_colors.dart';
import 'package:pmprod/styles/app_dimensions.dart';
import 'package:pmprod/styles/app_text_styles.dart';
import 'package:pmprod/widgets/part_quantity.dart';

class StatusTab extends StatefulWidget {
  final List<PartStatusesModel> partOrderStatuses;

  const StatusTab({
    super.key,
    required this.partOrderStatuses,
  });

  @override
  State<StatusTab> createState() => _StatusTabState();
}

class _StatusTabState extends State<StatusTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: _buildListView(),
        ),
      ],
    );
  }

  Widget _buildListView() {
    return Padding(
      padding: const EdgeInsets.all(AppDimensions.defaultPadding),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: widget.partOrderStatuses.length,
        itemBuilder: (_, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _listViewItem(index),
          );
        },
      ),
    );
  }

  bool isMissingpart(int index) {
    return widget.partOrderStatuses[index].order.contains('/B');
  }

  List<Widget> _listViewItem(int index) {
    return [
      const Space.vertical(AppDimensions.defaultPadding),
      Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isMissingpart(index)) Text("Zgłoszono braki", style: AppTextStyles.title(color: AppColors.red)),
              isMissingpart(index)
                  ? Text("Data zgłoszenia: ${widget.partOrderStatuses[index].date.getDateWithTime}")
                  : const SizedBox.shrink(),
              Text(
                "Zlecenie: ${widget.partOrderStatuses[index].order}",
                style: AppTextStyles.listViewText(),
              ),
              Text(
                "Operacja: ${widget.partOrderStatuses[index].operator}",
                style: AppTextStyles.listViewText(),
              ),
              Text(
                "Zaplanowane: ${widget.partOrderStatuses[index].deadline.convertToDateTimeAndGetOnlyDate}",
                style: AppTextStyles.listViewTextBold(),
              ),
              if (widget.partOrderStatuses[index].order.contains('/MP1/'))
                Text(
                  "Maszyna: ${widget.partOrderStatuses[index].machine}",
                  style: AppTextStyles.listViewText(),
                ),
            ],
          ),
          const Spacer(),
          PartQuantityWidget(
              orderQuantity: widget.partOrderStatuses[index].quantity,
              realizedQuantity: widget.partOrderStatuses[index].realizedQuantity),
        ],
      ),
      const Divider(
        color: AppColors.grey,
      ),
    ];
  }
}
