import 'package:ai_quiz_checker/features/questions/view/questions_view.dart';
import 'package:ai_quiz_checker/product/utils/constants/product_constants.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ProductConstants.appName,
      home: QuestionsView(),
    );
  }
}
