import 'package:ai_quiz_checker/features/add_qa/view/add_qa_view.dart';
import 'package:ai_quiz_checker/features/home/view/home_view.dart';
import 'package:ai_quiz_checker/features/questions/view/questions_view.dart';
import 'package:ai_quiz_checker/features/result/view/result_view.dart';
import 'package:ai_quiz_checker/product/initialize/models/question.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: AddQARoute.page),
        AutoRoute(page: QuestionsRoute.page),
        AutoRoute(
          page: ResultRoute.page,
        ),
      ];
}
