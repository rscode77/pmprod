import 'package:flutter/material.dart';
import 'package:pmprod/extensions/sized_box_extension.dart';
import 'package:pmprod/styles/app_colors.dart';
import 'package:pmprod/styles/app_dimensions.dart';
import 'package:pmprod/styles/app_text_styles.dart';
import 'package:pmprod/widgets/status_icon.dart';

class PartQuantityWidget extends StatelessWidget {
  final int orderQuantity;
  final int realizedQuantity;

  const PartQuantityWidget({
    super.key,
    required this.orderQuantity,
    required this.realizedQuantity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      decoration: BoxDecoration(
        color: orderQuantity <= realizedQuantity ? AppColors.green : AppColors.grey200,
        borderRadius: BorderRadius.circular(AppDimensions.defaultPadding),
      ),
      child: Row(
        children: [
          const Space.horizontal(8.0),
          StatusIconWidget(
            quantity: orderQuantity,
            realizedQuantity: realizedQuantity,
          ),
          const Space.horizontal(8.0),
          Text(
            '$realizedQuantity/$orderQuantity',
            style: AppTextStyles.quantityText(),
          ),
          const Space.horizontal(12.0),
        ],
      ),
    );
  }
}
