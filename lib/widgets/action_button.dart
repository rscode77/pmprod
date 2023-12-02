import 'package:flutter/material.dart';
import 'package:pmprod/styles/app_colors.dart';
import 'package:pmprod/styles/app_dimensions.dart';
import 'package:pmprod/styles/app_shadows.dart';
import 'package:pmprod/styles/app_text_styles.dart';

class ActionButton extends StatelessWidget {
  final Color borderColor;
  final Color fillColor;
  final VoidCallback? onPressed;
  final Color textColor;
  final String title;

  const ActionButton({
    super.key,
    this.borderColor = AppColors.transparent,
    this.fillColor = AppColors.red,
    this.onPressed,
    this.textColor = AppColors.white,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimensions.height.actionButton,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: fillColor,
          shadowColor: AppShadows.defaultShadow().color,
          elevation: 12.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.defaultRadius),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: AppTextStyles.actionButton(
            color: textColor,
          ),
        ),
      ),
    );
  }
}
