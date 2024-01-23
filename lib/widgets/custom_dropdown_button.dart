import 'package:flutter/material.dart';
import 'package:pmprod/styles/app_colors.dart';
import 'package:pmprod/styles/app_dimensions.dart';
import 'package:pmprod/styles/app_text_styles.dart';

class CustomDropDownButton extends StatefulWidget {
  final List<String> items;
  final TextEditingController controller;

  const CustomDropDownButton({super.key, required this.items, required this.controller});

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: AppDimensions.height.dropDownButtonHeight,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(AppDimensions.buttonRadius),
        ),
        border: Border.fromBorderSide(
          BorderSide(
            width: 1.0,
            color: AppColors.grey200,
          ),
        ),
      ),
      child: DropdownButton(
        isExpanded: true,
        itemHeight: AppDimensions.height.textField,
        style: AppTextStyles.textField(),
        alignment: Alignment.center,
        value: widget.controller.text,
        underline: const SizedBox.shrink(),
        items: widget.items.map<DropdownMenuItem<Object>>((Object value) {
          return DropdownMenuItem<Object>(
            value: value,
            child: Center(
              child: Text(
                value.toString(),
              ),
            ),
          );
        }).toList(),
        onChanged: (value) =>
        setState(() {
          widget.controller.text = value.toString();
        }),
      ),
    );
  }
}
