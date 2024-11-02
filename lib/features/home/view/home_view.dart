import 'package:ai_quiz_checker/features/questions/questions_store.dart';
import 'package:ai_quiz_checker/product/initialize/router/app_router.dart';
import 'package:ai_quiz_checker/product/utils/constants/product_constants.dart';
import 'package:ai_quiz_checker/product/widget/custom_elevated_button.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
final class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    final questionsStore = Provider.of<QuestionsStore>(context, listen: false);
    // ignore: cascade_invocations
    questionsStore.loadQuestions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4765ff),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              ProductConstants.appName,
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            CustomElevatedButton(
              backgroundColor: Colors.white,
              buttonTextStyle: const TextStyle(
                color: Color(0xFF4765ff),
                fontWeight: FontWeight.bold,
              ),
              buttonText: ProductConstants.questionTitle,
              onPressed: () {
                context.router.replaceAll([const QuestionsRoute()]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
