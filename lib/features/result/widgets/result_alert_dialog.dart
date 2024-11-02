import 'package:ai_quiz_checker/product/utils/constants/product_constants.dart';
import 'package:flutter/material.dart';

final class ResultAlertDialog extends StatelessWidget {
  const ResultAlertDialog({
    required this.resources,
    super.key,
  });
  final String resources;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(ProductConstants.resources),
      content: SingleChildScrollView(
        child: Text(resources),
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
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
