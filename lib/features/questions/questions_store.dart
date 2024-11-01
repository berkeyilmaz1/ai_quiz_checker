import 'package:ai_quiz_checker/product/initialize/models/question.dart';
import 'package:mobx/mobx.dart';

part 'questions_store.g.dart';

class QuestionsStore = _QuestionsStore with _$QuestionsStore;

abstract class _QuestionsStore with Store {
  @observable
  bool isLoading = false;

  @observable
  ObservableList<Question> questionList = ObservableList<Question>();

  @action
  void addQuestion(Question question) {
    isLoading = true;
    questionList.add(question);
    isLoading = false;
  }

  @action
  void removeQuestion(Question question) {
    isLoading = true;
    questionList.remove(question);
    isLoading = false;
  }
}
