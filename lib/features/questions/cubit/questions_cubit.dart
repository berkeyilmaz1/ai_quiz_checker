import 'package:ai_quiz_checker/features/questions/cubit/question_state.dart';
import 'package:ai_quiz_checker/product/initialize/models/question.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class IQuestionsCubit {
  void addQuestion(Question question);
  void removeQuestion(Question question);
  // void updateQuestion(Question question);
}

final class QuestionsCubit extends Cubit<QuestionState>
    implements IQuestionsCubit {
  QuestionsCubit() : super(QuestionState());

  void _changeLoading(bool value) {
    emit(state.copyWith(isLoading: value));
  }

  @override
  void addQuestion(Question question) {
    _changeLoading(true);

    final updatedQuestionList = [...?state.questionList, question];
    emit(state.copyWith(questionList: updatedQuestionList));
    _changeLoading(false);
  }

  void removeQuestion(Question question) {
    _changeLoading(true);
    final questionList = state.questionList ?? [];
    questionList.remove(question);
    emit(state.copyWith(questionList: questionList));
    _changeLoading(false);
  }

  // void updateQuestion(Question question) {
  //   _changeLoading(true);
  //   final questionList = state.questionList ?? [];
  //   final index = questionList.indexWhere((element) => element.id == question.id);
  //   questionList[index] = question;
  //   emit(state.copyWith(questionList: questionList));
  //   _changeLoading(false);
  // }
}
