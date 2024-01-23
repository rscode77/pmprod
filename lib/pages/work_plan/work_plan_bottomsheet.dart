import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:pmprod/extensions/datetime_extension.dart';
import 'package:pmprod/extensions/sized_box_extension.dart';
import 'package:pmprod/generated/l10n.dart';
import 'package:pmprod/styles/app_colors.dart';
import 'package:pmprod/styles/app_text_styles.dart';
import 'package:pmprod/widgets/action_button.dart';
import 'package:intl/intl.dart';

class WorkPlanBottomSheet extends StatefulWidget {
  final String username;
  final Function onLogout;
  final Function onLoadOrder;
  final Function onLoadWorkPlan;
  final Function onNavigateToPartInProgress;
  final DateTime selectedDate;

  const WorkPlanBottomSheet({
    super.key,
    required this.username,
    required this.onLogout,
    required this.onLoadOrder,
    required this.onLoadWorkPlan,
    required this.onNavigateToPartInProgress,
    required this.selectedDate,
  });

  @override
  State<WorkPlanBottomSheet> createState() => _WorkPlanBottomSheetState();
}

TextEditingController dateController = TextEditingController();

class _WorkPlanBottomSheetState extends State<WorkPlanBottomSheet> {
  @override
  void initState() {
    dateController = TextEditingController(text: widget.selectedDate.getOnlyDate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildTitle(context),
        const Space.vertical(4.0),
        _buildDatePicker(context),
        const Space.vertical(8.0),
        _buildLoadByDate(context),
        const Space.vertical(4.0),
        _buildLoadByOrder(context),
        const Space.vertical(4.0),
        _buildPartsInProgressButton(context),
        const Space.vertical(34.0),
        _buildLogoutUserData(context),
      ],
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      widget.username,
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
        SizedBox(
          height: 100,
          child: DatePicker(
            DateTime.now().subtract(const Duration(days: 2)),
            initialSelectedDate: DateTime.now(),
            selectionColor: AppColors.orange,
            selectedTextColor: Colors.white,
            onDateChange: (date) {
              setState(() {
                dateController.text = date.getOnlyDate;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _buildLoadByDate(BuildContext context) {
    DateFormat format = DateFormat("yyyy-MM-dd");
    DateTime dateTime = format.parse(dateController.text);
    return ActionButton(
      fillColor: AppColors.orange,
      title: S.of(context).loadWorkPlan,
      onPressed: () => widget.onLoadWorkPlan(dateTime),
    );
  }

  Widget _buildLoadByOrder(BuildContext context) {
    return ActionButton(
      fillColor: AppColors.blackPrimary,
      title: S.of(context).loadOrder,
      onPressed: () => widget.onLoadOrder(),
    );
  }

  Widget _buildPartsInProgressButton(BuildContext context) {
    return ActionButton(
      fillColor: AppColors.blackPrimary,
      title: S.of(context).partInProgress,
      onPressed: () => widget.onNavigateToPartInProgress(),
    );
  }

  Widget _buildLogoutUserData(BuildContext context) {
    return ActionButton(
      fillColor: AppColors.blackPrimary,
      title: S.of(context).logout,
      onPressed: () => widget.onLogout(),
    );
  }
}
