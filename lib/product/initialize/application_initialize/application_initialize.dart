import 'package:ai_quiz_checker/product/cache/cache_setup.dart';

final class ApplicationInitialize {
  const ApplicationInitialize._();
  static void initialize() {
    CacheSetup.instance.setup();
  }
}
