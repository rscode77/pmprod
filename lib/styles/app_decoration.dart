import 'package:flutter/material.dart';
import 'package:pmprod/styles/app_colors.dart';
import 'package:pmprod/styles/app_dimensions.dart';

class AppDecoration {
  const AppDecoration._();

  static BoxDecoration boxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(AppDimensions.defaultRadius),
      border: Border.all(
        color: AppColors.grey200,
      ),
      color: Colors.white,
    );
  }

  static BoxDecoration workPlanItemDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(AppDimensions.defaultRadius),
      border: Border.all(
        color: AppColors.grey,
        width: 2.0
      ),
      color: Colors.white,
    );
  }

  static BoxDecoration searchBarDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(AppDimensions.searchBarRadius),
      color: AppColors.grey,
    );
  }
}