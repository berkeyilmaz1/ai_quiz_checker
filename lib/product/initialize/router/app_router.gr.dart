// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [AddQAView]
class AddQARoute extends PageRouteInfo<AddQARouteArgs> {
  AddQARoute({
    Key? key,
    required bool isQuestionPage,
    Question? question,
    List<PageRouteInfo>? children,
  }) : super(
          AddQARoute.name,
          args: AddQARouteArgs(
            key: key,
            isQuestionPage: isQuestionPage,
            question: question,
          ),
          initialChildren: children,
        );

  static const String name = 'AddQARoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AddQARouteArgs>();
      return AddQAView(
        key: args.key,
        isQuestionPage: args.isQuestionPage,
        question: args.question,
      );
    },
  );
}

class AddQARouteArgs {
  const AddQARouteArgs({
    this.key,
    required this.isQuestionPage,
    this.question,
  });

  final Key? key;

  final bool isQuestionPage;

  final Question? question;

  @override
  String toString() {
    return 'AddQARouteArgs{key: $key, isQuestionPage: $isQuestionPage, question: $question}';
  }
}

/// generated route for
/// [HomeView]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeView();
    },
  );
}

/// generated route for
/// [QuestionsView]
class QuestionsRoute extends PageRouteInfo<void> {
  const QuestionsRoute({List<PageRouteInfo>? children})
      : super(
          QuestionsRoute.name,
          initialChildren: children,
        );

  static const String name = 'QuestionsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return QuestionsView();
    },
  );
}
