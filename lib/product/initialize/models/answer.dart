import 'package:equatable/equatable.dart';

final class Answer extends Equatable {
  Answer({this.questionId, this.id, this.title});
  final int? questionId;
  final int? id;
  final String? title;

  @override
  List<Object?> get props => [id, title, questionId];

  Answer copyWith({
    int? id,
    String? title,
    int? questionId,
  }) {
    return Answer(
      id: id ?? this.id,
      title: title ?? this.title,
      questionId: questionId ?? this.questionId,
    );
  }

  // JSON dönüşümü için toJson metodu
  Map<String, dynamic> toJson() => {
        'questionId': questionId,
        'id': id,
        'title': title,
      };

  // JSON’dan model oluşturmak için fromJson metodu
  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
      questionId: json['questionId'] as int?,
      id: json['id'] as int?,
      title: json['title'] as String?,
    );
  }
}
