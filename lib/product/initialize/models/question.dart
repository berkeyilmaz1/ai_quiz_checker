import 'package:equatable/equatable.dart';
import 'package:mobx/mobx.dart';

import 'answer.dart';

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

  // JSON dönüşümü için toJson metodu
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'answers': answers.map((answer) => answer.toJson()).toList(),
      };

  // JSON’dan model oluşturmak için fromJson metodu
  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'] as int?,
      title: json['title'] as String?,
      answers: ObservableList.of(
        (json['answers'] as List)
            .map((answerJson) => Answer.fromJson(answerJson))
            .toList(),
      ),
    );
  }
}
