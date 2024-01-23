import 'package:flutter/material.dart';
import 'package:pmprod/styles/app_colors.dart';
import 'package:pmprod/styles/app_dimensions.dart';
import 'package:pmprod/styles/app_text_styles.dart';

class DataTextField extends StatefulWidget {
  final TextEditingController controller;
  final bool isReadOnly;
  final Function()? onTap;
  final String? hintText;

  const DataTextField({
    super.key,
    required this.controller,
    this.isReadOnly = false,
    this.onTap,
    required this.hintText,
  });

  @override
  State<DataTextField> createState() => _DataTextFieldState();
}

class _DataTextFieldState extends State<DataTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimensions.height.textField,
      child: TextField(
       textInputAction: TextInputAction.done,
        onTap: widget.onTap,
        readOnly: widget.isReadOnly,
        textAlignVertical: TextAlignVertical.center,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: widget.controller,
        style: AppTextStyles.textField(),
        decoration: InputDecoration(
          fillColor: AppColors.white,
          hintText: widget.hintText,
          hintStyle: AppTextStyles.textField(),
          contentPadding: EdgeInsets.zero,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(AppDimensions.buttonRadius),
            ),
            borderSide: BorderSide(
              color: AppColors.grey200,
              width: 1.0,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(AppDimensions.buttonRadius),
            ),
            borderSide: BorderSide(
              color: AppColors.orange,
              width: 1.0,
            ),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.grey,
              width: 1.0,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(AppDimensions.buttonRadius),
            ),
          ),
        ),
      ),
    );
  }
}
