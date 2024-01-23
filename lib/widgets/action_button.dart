import 'package:flutter/material.dart';
import 'package:pmprod/styles/app_colors.dart';
import 'package:pmprod/styles/app_dimensions.dart';
import 'package:pmprod/styles/app_text_styles.dart';

class ActionButton extends StatelessWidget {
  final Color borderColor;
  final Color fillColor;
  final VoidCallback? onPressed;
  final Color textColor;
  final String title;
  final double width;

  const ActionButton({
    super.key,
    this.borderColor = Colors.transparent,
    this.fillColor = AppColors.blackPrimary,
    this.onPressed,
    this.textColor = AppColors.white,
    this.width = double.infinity,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimensions.height.actionButton,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: fillColor,
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.buttonRadius),
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
