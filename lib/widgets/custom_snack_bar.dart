import 'package:flutter/material.dart';
import 'package:pmprod/styles/app_colors.dart';

enum SnackBarType {
  success,
  error,
  info,
}

class CustomSnackBar {
  final BuildContext context;
  final SnackBarType type;
  final String message;

  CustomSnackBar({
    required this.context,
    required this.message,
    required this.type
  });

  void showSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        content: Text(message),
        backgroundColor: _getSnackBarColor(),
      ),
    );
  }

  Color _getSnackBarColor() {
    switch (type) {
      case SnackBarType.success:
        return AppColors.green;
      case SnackBarType.error:
        return AppColors.orange;
      case SnackBarType.info:
        return AppColors.blue;
      default:
        return AppColors.grey;
    }
  }
}
