import 'package:ai_quiz_checker/product/initialize/router/app_router.dart';
import 'package:ai_quiz_checker/product/initialize/theme/app_theme.dart';
import 'package:ai_quiz_checker/product/utils/constants/product_constants.dart';
import 'package:flutter/material.dart';

final class MainApp extends StatelessWidget {
  const MainApp({super.key});
  static final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: false,
      title: ProductConstants.appName,
      theme: ApplicationTheme().appTheme(),
    );
  }
}
