import 'package:ai_quiz_checker/product/utils/constants/product_constants.dart';
import 'package:flutter/material.dart';

final class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(ProductConstants.areYouSure),
      content: Text(ProductConstants.areYouSureContent),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(ProductConstants.no),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(ProductConstants.yes),
        ),
      ],
    );
  }
}