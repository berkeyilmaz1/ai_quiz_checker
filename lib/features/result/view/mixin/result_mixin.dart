import 'package:ai_quiz_checker/features/result/view/result_view.dart';
import 'package:ai_quiz_checker/features/result/widgets/best_answer_dialog.dart';
import 'package:ai_quiz_checker/features/result/widgets/result_alert_dialog.dart';
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

  Future<void> navigateToQuestionView() async {
    await context.router.maybePop();
  }

  void showBestAnswer() {
    showDialog<AlertDialog>(
      context: context,
      builder: (BuildContext context) {
        return BestAnswerDialog(
          bestAnswer: widget.bestAnswer,
        );
      },
    );
  }

  void showResourcesDialog() {
    showDialog<AlertDialog>(
      context: context,
      builder: (BuildContext context) {
        return ResultAlertDialog(resources: widget.resources);
      },
    );
  }
}
