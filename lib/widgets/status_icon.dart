import 'package:flutter/material.dart';
import 'package:pmprod/styles/app_colors.dart';
import 'package:pmprod/styles/app_dimensions.dart';

class StatusIconWidget extends StatelessWidget {
  final int quantity;
  final int realizedQuantity;

  const StatusIconWidget({
    super.key,
    required this.quantity,
    required this.realizedQuantity,
  });

  @override
  Widget build(BuildContext context) {
    if (quantity <= realizedQuantity) {
      return Icon(
        Icons.check_rounded,
        size: AppDimensions.height.iconSize,
        color: AppColors.white,
      );
    }
    else if (quantity > realizedQuantity && realizedQuantity != 0) {
      return Icon(
        Icons.bookmark_rounded,
        size: AppDimensions.height.iconSize,
        color: AppColors.white,
      );
    }
    // else if (quantity > realizedQuantity && realizedQuantity > 0) {
    //   return Icon(
    //     Icons.access_time_sharp,
    //     size: AppDimensions.height.iconSize,
    //     color: AppColors.white,
    //   );
    // }
    return Icon(
      Icons.circle_outlined,
      size: AppDimensions.height.iconSize,
      color: AppColors.white,
    );
  }
}
