import 'package:flutter/material.dart';
import 'package:pmprod/styles/app_dimensions.dart';

class AppDecoration {
  const AppDecoration._();

  static BoxDecoration boxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(AppDimensions.defaultRadius),
      border: Border.all(
        color: Colors.grey,
      ),
      color: Colors.white,
    );
  }
}