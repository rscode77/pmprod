import 'package:flutter/material.dart';
import 'package:pmprod/extensions/sized_box_extension.dart';
import 'package:pmprod/networking/models/part_details_model.dart';
import 'package:pmprod/styles/app_dimensions.dart';
import 'package:pmprod/widgets/action_button.dart';
import 'package:pmprod/widgets/data_text_field.dart';

class RealizationTab extends StatefulWidget {
  final PartDetailModel partDetail;

  const RealizationTab({
    super.key,
    required this.partDetail,
  });

  @override
  State<RealizationTab> createState() => _RealizationTabState();
}

class _RealizationTabState extends State<RealizationTab> {
  final TextEditingController _userIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DataTextField(
          controller: _userIdController,
          labelText: 'Wprowadź aktualną ilość',
        ),
        Space.vertical(AppDimensions.defaultPadding),
        ActionButton(
          title: 'Zapisz',
          onPressed: () => print(_userIdController.text),
        ),
      ],
    );
  }
}
