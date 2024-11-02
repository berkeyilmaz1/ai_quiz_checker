// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questions_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$QuestionsStore on _QuestionsStore, Store {
  late final _$isLoadingAtom =
      Atom(name: '_QuestionsStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$questionListAtom =
      Atom(name: '_QuestionsStore.questionList', context: context);

  @override
  ObservableList<Question> get questionList {
    _$questionListAtom.reportRead();
    return super.questionList;
  }

  @override
  set questionList(ObservableList<Question> value) {
    _$questionListAtom.reportWrite(value, super.questionList, () {
      super.questionList = value;
    });
  }

  late final _$loadQuestionsAsyncAction =
      AsyncAction('_QuestionsStore.loadQuestions', context: context);

  @override
  Future<void> loadQuestions() {
    return _$loadQuestionsAsyncAction.run(() => super.loadQuestions());
  }

  late final _$saveQuestionsAsyncAction =
      AsyncAction('_QuestionsStore.saveQuestions', context: context);

  @override
  Future<void> saveQuestions() {
    return _$saveQuestionsAsyncAction.run(() => super.saveQuestions());
  }

  late final _$deleteQuestionsAsyncAction =
      AsyncAction('_QuestionsStore.deleteQuestions', context: context);

  @override
  Future<void> deleteQuestions() {
    return _$deleteQuestionsAsyncAction.run(() => super.deleteQuestions());
  }

  late final _$_QuestionsStoreActionController =
      ActionController(name: '_QuestionsStore', context: context);

  @override
  void addQuestion(Question question) {
    final _$actionInfo = _$_QuestionsStoreActionController.startAction(
        name: '_QuestionsStore.addQuestion');
    try {
      return super.addQuestion(question);
    } finally {
      _$_QuestionsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeQuestion(Question question) {
    final _$actionInfo = _$_QuestionsStoreActionController.startAction(
        name: '_QuestionsStore.removeQuestion');
    try {
      return super.removeQuestion(question);
    } finally {
      _$_QuestionsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addAnswer(Answer answer, Question question) {
    final _$actionInfo = _$_QuestionsStoreActionController.startAction(
        name: '_QuestionsStore.addAnswer');
    try {
      return super.addAnswer(answer, question);
    } finally {
      _$_QuestionsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
questionList: ${questionList}
    ''';
  }
}
