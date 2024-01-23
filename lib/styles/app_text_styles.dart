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

  static TextStyle appBar() {
    return const TextStyle(
      color: AppColors.blackPrimary,
      fontSize: 16.0,
    );
  }

  static TextStyle listViewText() {
    return const TextStyle(
      color: AppColors.blackPrimary,
      fontSize: 14.0,
    );
  }

  static TextStyle listViewTextBold() {
    return const TextStyle(
      color: AppColors.blackPrimary,
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle info() {
    return const TextStyle(
      color: AppColors.blackPrimary,
      fontSize: 14.0,
    );
  }

  static TextStyle infoSmall() {
    return const TextStyle(
      color: AppColors.blackPrimary,
      fontSize: 10.0,
    );
  }

  static TextStyle quantityText() {
    return const TextStyle(
      color: AppColors.white,
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle textField() {
    return const TextStyle(
      color: AppColors.blackPrimary,
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
    );
  }

  static TextStyle textFieldError() {
    return const TextStyle(
      color: AppColors.red,
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
    Color color = AppColors.blackPrimary,
    TextDecoration? decoration,
    double fontSize = 18.0,
    FontStyle? fontStyle,
    FontWeight fontWeight = FontWeight.w500,
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
