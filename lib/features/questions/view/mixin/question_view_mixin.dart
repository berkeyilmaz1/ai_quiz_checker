import 'package:ai_quiz_checker/features/questions/cubit/questions_cubit.dart';
import 'package:ai_quiz_checker/features/questions/view/questions_view.dart';
import 'package:flutter/material.dart';

mixin QuestionViewMixin on State<QuestionsView> {
  late final QuestionsCubit _questionsCubit;
  QuestionsCubit get questionCubit => _questionsCubit;

  bool _customIcon = false;
  bool get customIcon => _customIcon;

  set customIcon(bool value) {
    _customIcon = value;
  }

  @override
  void initState() {
    super.initState();
    _questionsCubit = QuestionsCubit();
  }
}
