import 'package:flutter/material.dart';
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
        onTap: widget.onTap,
        readOnly: widget.isReadOnly,
        textAlignVertical: TextAlignVertical.center,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: widget.controller,
        style: AppTextStyles.textField(),
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: AppTextStyles.textField(),
          contentPadding: EdgeInsets.zero,
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(AppDimensions.defaultRadius),
            ),
            borderSide: BorderSide(
              color: Colors.blue,
              width: 2.0,
            ),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(AppDimensions.defaultRadius),
            ),
          ),
        ),
      ),
    );
  }
}
