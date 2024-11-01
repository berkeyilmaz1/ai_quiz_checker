import 'package:ai_quiz_checker/product/cache/cache_setup.dart';

enum CacheItems {
  questions;
}

extension CacheItemsExtension on CacheItems {
  Future<bool> writeStringList(List<String> value) =>
      CacheSetup.instance.sharedPreferences.setStringList(name, value);

  List<String>? get readStringList =>
      CacheSetup.instance.sharedPreferences.getStringList(name);

  Future<bool> deleteStringList() =>
      CacheSetup.instance.sharedPreferences.remove(name);
}
