import 'package:flutter/material.dart';
import 'package:pmprod/styles/app_colors.dart';

class AppTextStyles {

  const AppTextStyles._();

  static TextStyle actionButton({
    Color color = AppColors.blackPrimary,
    TextDecoration? decoration,
    double fontSize = 15.0,
    FontWeight fontWeight = FontWeight.w500,
  }) {
    return TextStyle(
      color: color,
      decoration: decoration,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }

  static TextStyle textField() {
    return const TextStyle(
      color: AppColors.black15,
      fontSize: 15.0,
      fontWeight: FontWeight.normal,
    );
  }

  static TextStyle textFieldError() {
    return const TextStyle(
      color: AppColors.darkRed,
      fontSize: 13.0,
    );
  }

  static TextStyle textFieldFloatingLabel() {
    return const TextStyle(
      fontSize: 13.0,
      fontWeight: FontWeight.w300,
      color: AppColors.grey600,
    );
  }

  static TextStyle textFieldHint({
    double fontSize = 15.0,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w300,
      color: AppColors.grey600,
    );
  }

  static TextStyle title({
    Color color = AppColors.black,
    TextDecoration? decoration,
    double fontSize = 18.0,
    FontStyle? fontStyle,
    FontWeight fontWeight = FontWeight.normal,
    double? height,
  }) {
    return TextStyle(
      color: color,
      decoration: decoration,
      fontSize: fontSize,
      fontStyle: fontStyle,
      fontWeight: fontWeight,
      height: height,
    );
  }
}
