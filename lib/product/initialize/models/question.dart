import 'package:ai_quiz_checker/product/initialize/models/answer.dart';
import 'package:equatable/equatable.dart';
import 'package:mobx/mobx.dart';

final class Question extends Equatable {
  Question({
    this.id,
    this.title,
    ObservableList<Answer>? answers,
  }) : answers = answers ?? ObservableList<Answer>();
  final int? id;
  final String? title;
  final ObservableList<Answer> answers;

  @override
  List<Object?> get props => [id, title, answers];

  Question copyWith({
    int? id,
    String? title,
    ObservableList<Answer>? answers,
  }) {
    return Question(
      id: id ?? this.id,
      title: title ?? this.title,
      answers: answers ?? this.answers,
    );
  }
}
