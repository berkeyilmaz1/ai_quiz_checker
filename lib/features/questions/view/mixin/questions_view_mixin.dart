import 'package:ai_quiz_checker/features/questions/gemini_helper.dart';
import 'package:ai_quiz_checker/features/questions/view/questions_view.dart';
import 'package:ai_quiz_checker/product/initialize/config/app_environment.dart';
import 'package:ai_quiz_checker/product/initialize/models/question.dart';
import 'package:ai_quiz_checker/product/initialize/router/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

mixin QuestionsViewMixin on State<QuestionsView> {
  final GeminiHelper _geminiHelper = GeminiHelper(
    AppEnvironmentItems.apiKey.value,
  );
  Future<void> solveOnPressed(Question question, int answerIndex) async {
    final response = await _geminiHelper.evaluateAnswer(
      question.title ?? '',
      question.answers[answerIndex].title ?? '',
    );
    final accuracyRate = response['accuracyRate'];
    final bestAnswer = response['bestAnswer'];
    final resources = response['resources'];
    if (!mounted) return;
    await navigateToResultView(
      double.tryParse(accuracyRate.toString()) ?? 0.0,
      bestAnswer.toString(),
      resources.toString(),
    );
  }

  void showNotification(Question question) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${question.title} silindi'),
      ),
    );
  }

  Future<void> navigateToResultView(
    double accuracyRate,
    String bestAnswer,
    String resources,
  ) async {
    await context.router.push(
      ResultRoute(
        accuracyRate: accuracyRate,
        bestAnswer: bestAnswer,
        resources: resources,
      ),
    );
  }
}
