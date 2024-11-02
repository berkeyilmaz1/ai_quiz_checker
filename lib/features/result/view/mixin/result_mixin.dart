import 'package:ai_quiz_checker/features/result/view/result_view.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

mixin ResultMixin on State<ResultView> {
  void navigateToQuestionView() {
    context.router.maybePop();
  }
}
