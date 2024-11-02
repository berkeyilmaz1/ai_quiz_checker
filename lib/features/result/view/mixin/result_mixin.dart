import 'package:ai_quiz_checker/features/result/view/result_view.dart';
import 'package:ai_quiz_checker/product/utils/constants/product_constants.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

mixin ResultMixin on State<ResultView> {
  final maxLines = 8;
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void dispose() {
    controller.dispose(); // Kontrolörü serbest bırak
    super.dispose();
  }

  MaterialColor checkBackgroundColor() {
    if (widget.accuracyRate >= 75) {
      return Colors.green;
    }
    if (widget.accuracyRate >= 25) {
      return Colors.yellow;
    }
    return Colors.red;
  }

  void navigateToQuestionView() {
    context.router.maybePop();
  }

  void showBestAnswer() {
    showDialog<AlertDialog>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(ProductConstants.bestAnswer),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(widget.bestAnswer),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(ProductConstants.close),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  void showResourcesDialog() {
    showDialog<AlertDialog>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(ProductConstants.resources),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(widget.resources),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(ProductConstants.close),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
