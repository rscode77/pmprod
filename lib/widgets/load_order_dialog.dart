import 'package:flutter/material.dart';
import 'package:pmprod/constants.dart';
import 'package:pmprod/extensions/sized_box_extension.dart';
import 'package:pmprod/generated/l10n.dart';
import 'package:pmprod/styles/app_dimensions.dart';
import 'package:pmprod/widgets/action_button.dart';
import 'package:pmprod/widgets/custom_dropdown_button.dart';
import 'package:pmprod/widgets/data_text_field.dart';

class LoadOrderDialog extends StatefulWidget {
  final Function(String) order;

  const LoadOrderDialog({
    super.key,
    required this.order,
  });

  @override
  State<LoadOrderDialog> createState() => _LoadOrderDialogState();
}

class _LoadOrderDialogState extends State<LoadOrderDialog> {
  final TextEditingController _orderController = TextEditingController();
  final TextEditingController _magazineController = TextEditingController(text: Constants.defaultOrderMagazine);
  final TextEditingController _yearController = TextEditingController(text: DateTime.now().year.toString());

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(S.of(context).loadOrder),
      content: Text(S.of(context).order),
      actions: _buildBody(),
    );
  }

  List<Widget> _buildBody() {
    return [
      _buildOrderTextField(),
      const Space.vertical(6.0),
      _buildMagazineDropDown(),
      const Space.vertical(12.0),
      _buildYearDropDown(),
      const Space.vertical(AppDimensions.defaultPadding),
      _buildConfirmButton(),
    ];
  }

  Widget _buildOrderTextField() {
    return DataTextField(
      controller: _orderController,
      hintText: S.of(context).selectOrderToLoad,
    );
  }

  Widget _buildMagazineDropDown() {
    return CustomDropDownButton(
      controller: _magazineController,
      items: Constants.listOfMagazines,
    );
  }

  Widget _buildYearDropDown() {
    return CustomDropDownButton(
      controller: _yearController,
      items: [
        DateTime.now().year.toString(),
        (DateTime.now().year - 1).toString(),
      ],
    );
  }

  Widget _buildConfirmButton() {
    return ActionButton(
      title: S.of(context).loadData,
      onPressed: () {
        widget.order('ZK ${_orderController.text}/${_magazineController.text}/${_yearController.text}');
        Navigator.pop(context,true);
      },
    );
  }
}
