import 'package:ai_quiz_checker/features/result/view/result_view.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

mixin ResultMixin on State<ResultView> {
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
}
