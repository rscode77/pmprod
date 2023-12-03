import 'package:flutter/material.dart';
import 'package:pmprod/extensions/int_extension.dart';
import 'package:pmprod/extensions/sized_box_extension.dart';
import 'package:pmprod/generated/l10n.dart';
import 'package:pmprod/networking/models/part_details_model.dart';
import 'package:pmprod/pages/bloc_page_state.dart';
import 'package:pmprod/pages/part_details/bloc/part_details_bloc.dart';
import 'package:pmprod/styles/app_dimensions.dart';
import 'package:pmprod/styles/app_text_styles.dart';
import 'package:pmprod/widgets/action_button.dart';
import 'package:pmprod/widgets/confirm_dialog.dart';
import 'package:pmprod/widgets/data_text_field.dart';
import 'package:pmprod/widgets/missing_parts_dialog.dart';

class RealizationTab extends StatefulWidget {
  final PartDetailModel partDetail;

  const RealizationTab({
    super.key,
    required this.partDetail,
  });

  @override
  State<RealizationTab> createState() => _RealizationTabState();
}

class _RealizationTabState extends BlocPageState<RealizationTab, PartDetailBloc> {
  final TextEditingController _userIdController = TextEditingController();

  int get partUniqueId => widget.partDetail.partUniqueId;

  int get actualQuantity => widget.partDetail.realizedQuantity.toInt();

  int get updatedQuantity => int.tryParse(_userIdController.text) ?? actualQuantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.defaultPadding),
      child: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        _buildPartDescription(),
        const Space.vertical(24.0),
        _buildActualQuantityTextField(),
        const Space.vertical(30.0),
        _buildSaveButton(),
        const Space.vertical(6.0),
        _buildReportMissingPartsButton(),
      ],
    );
  }

  Widget _buildPartDescription() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).partDescription,
            style: AppTextStyles.title(),
          ),
          const Space.vertical(AppDimensions.defaultPadding),
          Text(
            widget.partDetail.mainOrder,
            style: AppTextStyles.info(),
          ),
          const Space.vertical(4.0),
          Text(
            widget.partDetail.productionOrder,
            style: AppTextStyles.info(),
          ),
          const Space.vertical(AppDimensions.defaultPadding),
          Text(
            '${S.of(context).material} ${widget.partDetail.material}',
            style: AppTextStyles.info(),
          ),
          const Space.vertical(4.0),
          Text(
            '${S.of(context).orderQuantity} ${widget.partDetail.quantity.toInt()}',
            style: AppTextStyles.info(),
          ),
        ],
      ),
    );
  }

  Widget _buildActualQuantityTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).actualRealizedQuantity,
          style: AppTextStyles.info(),
        ),
        const Space.vertical(8.0),
        DataTextField(
          controller: _userIdController,
          hintText: '${widget.partDetail.realizedQuantity.toInt()}',
        ),
      ],
    );
  }

  Widget _buildSaveButton() {
    return ActionButton(
      title: S.of(context).save,
      onPressed: () => _confirmRealizedParts(),
    );
  }

  Widget _buildReportMissingPartsButton() {
    return ActionButton(
      title: S.of(context).reportMissingParts,
      onPressed: () => _reportMissingParts(),
    );
  }

  void _confirmRealizedParts() {
    if (actualQuantity == updatedQuantity) return;
    showDialog(
      context: context,
      builder: (context) => ConfirmDialog(
        confirmationTitle: S.of(context).confirmQuantity,
      ),
    ).then(
      (value) {
        if (value) {
          bloc.add(UpdateQuantityEvent(quantity: updatedQuantity));
        }
      },
    );
  }

  void _reportMissingParts() {
    int? quantity;
    showDialog(
      context: context,
      builder: (context) => MissingPartsDialog(
        quantity: (int value) {
          quantity = value;
        },
      ),
    ).then(
      (_) {
        if (!quantity.isNotNullAndGreaterThanZero()) return;
        bloc.add(
          ReportMissingPartEvent(
            partUniqueId: partUniqueId,
            quantity: quantity.orZero(),
          ),
        );
      },
    );
  }
}
