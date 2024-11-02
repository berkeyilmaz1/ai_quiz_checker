import 'package:ai_quiz_checker/product/utils/constants/product_constants.dart';
import 'package:flutter/material.dart';

final class BestAnswerDialog extends StatelessWidget {
  const BestAnswerDialog({
    required this.bestAnswer,
    super.key,
  });
  final String bestAnswer;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(ProductConstants.bestAnswer),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(bestAnswer),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text(
            ProductConstants.close,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }
}
