import 'package:ai_quiz_checker/product/initialize/models/question.dart';
import 'package:equatable/equatable.dart';

final class QuestionState extends Equatable {
  const QuestionState({
    this.isLoading = false,
    this.questionList,
  });

  final bool isLoading;
  final List<Question>? questionList;

  @override
  List<Object?> get props => [
        isLoading,
        questionList,
      ];

  QuestionState copyWith({
    bool? isLoading,
    List<Question>? questionList,
  }) {
    return QuestionState(
      isLoading: isLoading ?? this.isLoading,
      questionList: questionList ?? this.questionList,
    );
  }
}
