import 'package:ai_quiz_checker/product/initialize/router/app_router.dart';
import 'package:ai_quiz_checker/product/utils/constants/product_constants.dart';
import 'package:ai_quiz_checker/product/widget/custom_elevated_button.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
final class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ///todo style
            const Text(
              ProductConstants.appName,
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            CustomElevatedButton(
                buttonText: ProductConstants.questionTitle,
                onPressed: () {
                  context.router.replaceAll([QuestionsRoute()]);
                })
          ],
        ),
      ),
    );
  }
}
