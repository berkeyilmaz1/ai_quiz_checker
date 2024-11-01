import 'dart:convert';

import 'package:ai_quiz_checker/product/cache/enums/cache_items.dart';
import 'package:ai_quiz_checker/product/initialize/models/question.dart';

final class CacheService {
  Future<bool> writeQuestionsList(List<Question> questions) {
    List<String> jsonList =
        questions.map((q) => jsonEncode(q.toJson())).toList();
    return CacheItems.questions.writeStringList(jsonList);
  }

  List<Question>? readQuestionsList() {
    List<String>? jsonList = CacheItems.questions.readStringList;
    return jsonList
        ?.map((json) => Question.fromJson(jsonDecode(json)))
        .toList();
  }

  Future<bool> deleteQuestionsList() => CacheItems.questions.deleteStringList();
}
