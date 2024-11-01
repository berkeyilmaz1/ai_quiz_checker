import 'package:ai_quiz_checker/product/cache/cache_service.dart';
import 'package:ai_quiz_checker/product/initialize/models/answer.dart';
import 'package:ai_quiz_checker/product/initialize/models/question.dart';
import 'package:mobx/mobx.dart';

part 'questions_store.g.dart';

class QuestionsStore = _QuestionsStore with _$QuestionsStore;

abstract class _QuestionsStore with Store {
  @observable
  bool isLoading = false;

  @observable
  ObservableList<Question> questionList = ObservableList<Question>();

  final CacheService _cacheService = CacheService();

  @action
  Future<void> loadQuestions() async {
    isLoading = true;
    final questions = await _cacheService.readQuestionsList();
    if (questions != null) {
      questionList.addAll(questions);
    }
    isLoading = false;
  }

  @action
  Future<void> saveQuestions() async {
    isLoading = true;
    await _cacheService.writeQuestionsList(questionList.toList());
    isLoading = false;
  }

  @action
  Future<void> deleteQuestions() async {
    isLoading = true;
    await _cacheService.deleteQuestionsList();
    questionList.clear(); // Local listeden de sil
    isLoading = false;
  }

  @action
  void addQuestion(Question question) {
    isLoading = true;
    questionList.add(question);
    saveQuestions();
    isLoading = false;
  }

  @action
  void removeQuestion(Question question) {
    isLoading = true;
    questionList.remove(question);
    saveQuestions();
    isLoading = false;
  }

  @action
  void addAnswer(Answer answer, Question question) {
    isLoading = true;
    final index =
        questionList.indexWhere((element) => element.title == question.title);
    questionList[index].answers.add(answer);
    saveQuestions();
    isLoading = false;
  }
}
