import 'package:ai_quiz_checker/features/questions/questions_store.dart';
import 'package:ai_quiz_checker/product/initialize/router/app_router.dart';
import 'package:ai_quiz_checker/product/utils/constants/product_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<QuestionsStore>(create: (_) => QuestionsStore()),
      ],
      child: MainApp(),
    ),
  );
}

final class MainApp extends StatelessWidget {
  const MainApp({super.key});
  static final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: false,
      title: ProductConstants.appName,
    );
  }
}
