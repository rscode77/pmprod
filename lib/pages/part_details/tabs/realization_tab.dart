import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pmprod/extensions/int_extension.dart';
import 'package:pmprod/extensions/sized_box_extension.dart';
import 'package:pmprod/extensions/string_extension.dart';
import 'package:pmprod/generated/l10n.dart';
import 'package:pmprod/networking/models/part_details_model.dart';
import 'package:pmprod/pages/bloc_page_state.dart';
import 'package:pmprod/pages/part_details/bloc/part_details_bloc.dart';
import 'package:pmprod/styles/app_colors.dart';
import 'package:pmprod/styles/app_dimensions.dart';
import 'package:pmprod/styles/app_text_styles.dart';
import 'package:pmprod/widgets/action_button.dart';
import 'package:pmprod/widgets/confirm_dialog.dart';
import 'package:pmprod/widgets/data_text_field.dart';
import 'package:pmprod/widgets/missing_parts_dialog.dart';
import 'package:pmprod/widgets/part_quantity.dart';

class RealizationTab extends StatefulWidget {
  final PartDetailModel partDetail;
  final String username;

  const RealizationTab({
    super.key,
    required this.username,
    required this.partDetail,
  });

  @override
  State<RealizationTab> createState() => _RealizationTabState();
}

class _RealizationTabState extends BlocPageState<RealizationTab, PartDetailBloc> {
  final TextEditingController _quantityController = TextEditingController();

  int get partUniqueId => widget.partDetail.partUniqueId;

  int get actualQuantity => widget.partDetail.realizedQuantity.toInt();

  int get updatedQuantity => int.tryParse(_quantityController.text) ?? actualQuantity;

  ValueNotifier<bool> get isPartInProgress => context.read<PartDetailBloc>().isPartInProgress;

  bool get isPartRealized => widget.partDetail.realizedQuantity.toInt() >= widget.partDetail.quantity.toInt();

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
        const Space.vertical(16.0),
        if(!isPartRealized) _buildSaveButton(),
        const Spacer(),
        _buildReportMissingPartsButton(),
        const Space.vertical(16.0),
      ],
    );
  }

  Widget _buildPartDescription() {
    return Container(
      padding: const EdgeInsets.all(
        20.0,
      ),
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.circular(
          AppDimensions.defaultRadius,
        ),
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).partDescription,
                    style: AppTextStyles.title(),
                  ),
                  Text(
                    widget.partDetail.mainOrder,
                    style: AppTextStyles.info(),
                  ),
                  Text(
                    widget.partDetail.productionOrder,
                    style: AppTextStyles.info(),
                  ),
                  Text(
                    widget.partDetail.material,
                    style: AppTextStyles.info(),
                  ),
                ],
              ),
              PartQuantityWidget(
                orderQuantity: widget.partDetail.quantity.toInt(),
                realizedQuantity: widget.partDetail.realizedQuantity.toInt(),
              ),
            ],
          ),
          _buildPartComments(),
        ],
      ),
    );
  }

  Widget _buildPartComments() {
    if (widget.partDetail.comments.isNullOrBlank) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).comments,
            style: AppTextStyles.title(),
          ),
          Text(
            widget.partDetail.comments,
            style: AppTextStyles.info(),
          )
        ],
      ),
    );
  }

  Widget _buildActualQuantityTextField() {
    return ValueListenableBuilder(
        valueListenable: isPartInProgress,
        builder: (context, value, _) {
          if (!value) {
            return const SizedBox.shrink();
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Space.horizontal(4.0),
                  const Icon(
                    Icons.info_outline_rounded,
                    color: AppColors.blackPrimary,
                    size: 15.0,
                  ),
                  const Space.horizontal(4.0),
                  Text(
                    S.of(context).actualRealizedQuantity,
                    style: AppTextStyles.infoSmall(),
                  ),
                ],
              ),
              const Space.vertical(8.0),
              DataTextField(
                controller: _quantityController,
                hintText: '${widget.partDetail.realizedQuantity.toInt()}',
              ),
            ],
          );
        });
  }

  Widget _buildSaveButton() {
    return ValueListenableBuilder(
      valueListenable: isPartInProgress,
      builder: (context, value, _) {
        if (value) {
          return ActionButton(
            fillColor: AppColors.orange,
            title: S.of(context).stop,
            onPressed: () => _confirmRealizedParts(),
          );
        } else if (!value) {
          return ActionButton(
            fillColor: AppColors.orange,
            title: S.of(context).start,
            onPressed: () => _confirmRealizedParts(),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildReportMissingPartsButton() {
    return ActionButton(
      title: S.of(context).reportMissingParts,
      onPressed: () => _reportMissingParts(),
    );
  }

  void _confirmRealizedParts() {
    if (actualQuantity == updatedQuantity && isPartInProgress.value) return;
    showDialog(
      context: context,
      builder: (context) => ConfirmDialog(
        confirmationTitle: isPartInProgress.value ? S.of(context).confirmQuantity : S.of(context).startRealizaton,
      ),
    ).then(
      (value) {
        if (value) {
          _saveRealizedQuantity();
        }
      },
    );
  }

  void _saveRealizedQuantity() {
    bloc.add(
      UpdateQuantityEvent(
        quantity: updatedQuantity,
        username: widget.username,
      ),
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
            quantity: quantity.orZero(),
            reportingPerson: widget.username,
          ),
        );
      },
    );
  }
}
