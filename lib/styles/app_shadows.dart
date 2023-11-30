import 'package:flutter/material.dart';
import 'package:pmprod/styles/app_colors.dart';

class AppShadows {
  const AppShadows._();

  static BoxShadow defaultShadow({
    Offset offset = const Offset(0.0, 5.0),
  }) {
    return BoxShadow(
      color: AppColors.black.withOpacity(0.14),
      offset: offset,
      blurRadius: 12.0,
    );
  }
}
