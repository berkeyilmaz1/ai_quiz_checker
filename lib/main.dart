import 'package:ai_quiz_checker/features/questions/questions_store.dart';
import 'package:ai_quiz_checker/product/initialize/application_initialize/application_initialize.dart';
import 'package:ai_quiz_checker/product/initialize/main_app/main_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await ApplicationInitialize.initialize();
  runApp(
    MultiProvider(
      providers: [
        Provider<QuestionsStore>(create: (_) => QuestionsStore()),
      ],
      child: MainApp(),
    ),
  );
}
