import 'package:flutter/material.dart';
import 'package:pmprod/generated/l10n.dart';

class ConfirmDialog extends StatelessWidget {
  final String confirmationTitle;

  const ConfirmDialog({
    super.key,
    required this.confirmationTitle,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:  Text(S.of(context).confirmOperation),
      content: Text(confirmationTitle),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text(S.of(context).yes),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(S.of(context).no),
        ),
      ],
    );
  }
}
