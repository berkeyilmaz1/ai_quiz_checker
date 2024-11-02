import 'package:ai_quiz_checker/product/utils/constants/product_constants.dart';
import 'package:flutter/material.dart';

final class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({
    required this.onYes,
    required this.content,
    super.key,
  });
  final VoidCallback onYes;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(ProductConstants.areYouSure),
      content: content,
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            ProductConstants.no,
            style: TextStyle(
              color: Color(0xFF4765ff),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        TextButton(
          onPressed: onYes,
          child: const Text(
            ProductConstants.yes,
            style: TextStyle(
              color: Color(0xFF4765ff),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
