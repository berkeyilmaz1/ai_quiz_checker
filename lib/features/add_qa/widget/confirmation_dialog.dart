import 'package:ai_quiz_checker/product/utils/constants/product_constants.dart';
import 'package:flutter/material.dart';

final class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({
    super.key,
    required this.onYes,
    required this.content,
  });
  final VoidCallback onYes;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(ProductConstants.areYouSure),
      content: content,
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(ProductConstants.no),
        ),
        TextButton(
          onPressed: onYes,
          child: Text(ProductConstants.yes),
        ),
      ],
    );
  }
}
