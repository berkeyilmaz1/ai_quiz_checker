import 'package:ai_quiz_checker/product/cache/cache_setup.dart';
import 'package:ai_quiz_checker/product/initialize/config/app_environment.dart';
import 'package:ai_quiz_checker/product/initialize/config/env.dart';
import 'package:flutter/material.dart';

final class ApplicationInitialize {
  const ApplicationInitialize._();
  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await CacheSetup.instance.setup();
    AppEnvironment.setup(Env());
  }
}
