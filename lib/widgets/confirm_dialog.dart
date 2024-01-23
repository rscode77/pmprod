import 'package:flutter/material.dart';
import 'package:pmprod/extensions/sized_box_extension.dart';
import 'package:pmprod/generated/l10n.dart';
import 'package:pmprod/styles/app_colors.dart';
import 'package:pmprod/styles/app_dimensions.dart';
import 'package:pmprod/widgets/action_button.dart';

class ConfirmDialog extends StatefulWidget {
  final String confirmationTitle;

  const ConfirmDialog({
    super.key,
    required this.confirmationTitle,
  });

  @override
  State<ConfirmDialog> createState() => _ConfirmDialogState();
}

class _ConfirmDialogState extends State<ConfirmDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 0.0,
      title:  Text(S.of(context).confirmOperation),
      content: Text(widget.confirmationTitle),
      actions: [
        _buildConfirmButton(),
        const Space.vertical(AppDimensions.defaultPadding),
        _buildCancelButton(),
      ],
    );
  }

  Widget _buildConfirmButton() {
    return ActionButton(
      fillColor: AppColors.orange,
      title: S.of(context).yes,
      onPressed: () => {
        Navigator.of(context).pop(true)
      },
    );
  }

  Widget _buildCancelButton() {
    return ActionButton(
      fillColor: AppColors.grey1000,
      title: S.of(context).cancel,
      onPressed: () => Navigator.of(context).pop(false),
    );
  }
}
