import 'package:ai_quiz_checker/product/initialize/models/answer.dart';
import 'package:equatable/equatable.dart';

final class Question extends Equatable {
  const Question({
    this.id,
    this.title,
    this.answers,
  });
  final int? id;
  final String? title;
  final List<Answer>? answers;

  @override
  List<Object?> get props => [id, title, answers];

  Question copyWith({
    int? id,
    String? title,
    List<Answer>? answers,
  }) {
    return Question(
      id: id ?? this.id,
      title: title ?? this.title,
      answers: answers ?? this.answers,
    );
  }
}
