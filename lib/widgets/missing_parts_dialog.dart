import 'package:flutter/material.dart';
import 'package:pmprod/extensions/sized_box_extension.dart';
import 'package:pmprod/generated/l10n.dart';
import 'package:pmprod/styles/app_dimensions.dart';
import 'package:pmprod/widgets/action_button.dart';
import 'package:pmprod/widgets/data_text_field.dart';

class MissingPartsDialog extends StatefulWidget {
  final Function(int) quantity;

  const MissingPartsDialog({
    super.key,
    required this.quantity,
  });

  @override
  State<MissingPartsDialog> createState() => _MissingPartsDialogState();
}

class _MissingPartsDialogState extends State<MissingPartsDialog> {
  final TextEditingController _missingPartsQuantity = TextEditingController(text: '1');

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(S.of(context).confirmOperation),
      content: Text(S.of(context).enterNumberOfMissingParts),
      actions: _buildBody(),
    );
  }

  List<Widget> _buildBody() {
    return [
      _buildQuantityTextField(),
      const Space.vertical(AppDimensions.defaultPadding),
      _buildConfirmButton(),
      const Space.vertical(6.0),
      _buildCancelButton(),
    ];
  }

  Widget _buildQuantityTextField() {
    return DataTextField(
      controller: _missingPartsQuantity,
      hintText: _missingPartsQuantity.text,
    );
  }

  Widget _buildConfirmButton() {
    return ActionButton(
      title: S.of(context).save,
      onPressed: () => {
        widget.quantity(int.parse(_missingPartsQuantity.text)),
        Navigator.of(context).pop(),
      },
    );
  }

  Widget _buildCancelButton() {
    return ActionButton(
      title: S.of(context).cancel,
      onPressed: () => Navigator.of(context).pop(),
    );
  }
}
