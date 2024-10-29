import 'package:equatable/equatable.dart';

final class Answer extends Equatable {
  Answer({this.questionId, this.id, this.title});
  final int? questionId;
  final int? id;
  final String? title;

  @override
  // TODO: implement props
  List<Object?> get props => [id, title, questionId];

  Answer copyWith({
    int? id,
    String? answer,
    int? questionId,
  }) {
    return Answer(
      id: id ?? this.id,
      title: answer ?? this.title,
      questionId: questionId ?? this.questionId,
    );
  }
}
