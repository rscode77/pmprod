import 'package:flutter/material.dart';
import 'package:pmprod/extensions/sized_box_extension.dart';
import 'package:pmprod/generated/l10n.dart';
import 'package:pmprod/styles/app_text_styles.dart';
import 'package:pmprod/widgets/action_button.dart';
import 'package:pmprod/widgets/data_text_field.dart';

class WorkPlanBottomSheet extends StatelessWidget {
  final String username;
  final Function onShowDatePicker;
  final Function onLogout;
  final Function onLoadOrder;
  final TextEditingController dataController;

  const WorkPlanBottomSheet({
    super.key,
    required this.username,
    required this.onShowDatePicker,
    required this.onLogout,
    required this.onLoadOrder,
    required this.dataController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildTitle(context),
        const Space.vertical(4.0),
        _buildDatePicker(context),
        const Space.vertical(10.0),
        _buildLoadByOrder(context),
        const Spacer(),
        _buildLogoutUserData(context),
      ],
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      S.of(context).settings,
      style: AppTextStyles.title(),
    );
  }

  Widget _buildDatePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).selectDatePlan,
          style: AppTextStyles.info(),
        ),
        const Space.vertical(6.0),
        DataTextField(
          controller: dataController,
          isReadOnly: true,
          hintText: null,
          onTap: () => onShowDatePicker(),
        ),
      ],
    );
  }

  Widget _buildLoadByOrder(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).selectOrder,
          style: AppTextStyles.info(),
        ),
        const Space.vertical(6.0),
        ActionButton(
          title: S.of(context).loadOrder,
          onPressed: () => onLoadOrder(),
        ),
      ],
    );
  }

  Widget _buildLogoutUserData(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          username,
          style: AppTextStyles.title(),
        ),
        Text(
          S.of(context).logoutUser,
          style: AppTextStyles.info(),
        ),
        const Space.vertical(6.0),
        ActionButton(
          title: S.of(context).logout,
          onPressed: () => onLogout(),
        ),
      ],
    );
  }
}
