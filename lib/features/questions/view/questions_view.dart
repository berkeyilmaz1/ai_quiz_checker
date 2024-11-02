import 'package:ai_quiz_checker/features/questions/questions_store.dart';
import 'package:ai_quiz_checker/features/questions/view/mixin/questions_view_mixin.dart';
import 'package:ai_quiz_checker/product/initialize/router/app_router.dart';
import 'package:ai_quiz_checker/product/utils/constants/product_constants.dart';
import 'package:ai_quiz_checker/product/widgets/custom_elevated_button.dart';
import 'package:ai_quiz_checker/product/widgets/future_extension.dart';
import 'package:ai_quiz_checker/product/widgets/page/page_padding.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

@RoutePage()
final class QuestionsView extends StatefulWidget {
  const QuestionsView({super.key});

  @override
  State<QuestionsView> createState() => _QuestionsViewState();
}

class _QuestionsViewState extends State<QuestionsView> with QuestionsViewMixin {
  @override
  Widget build(BuildContext context) {
    final questionsStore = Provider.of<QuestionsStore>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.router.push(
            AddQARoute(
              isQuestionPage: true,
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          ProductConstants.questionTitle,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Observer(
        builder: (_) {
          if (questionsStore.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (questionsStore.questionList.isEmpty) {
            return Center(
              child: CustomElevatedButton(
                buttonText: ProductConstants.addQuestion,
                buttonTextStyle: const TextStyle(fontWeight: FontWeight.bold),
                onPressed: () =>
                    context.router.push(AddQARoute(isQuestionPage: true)),
              ),
            );
          }
          return ListView.builder(
            itemCount: questionsStore.questionList.length,
            itemBuilder: (context, index) {
              final question = questionsStore.questionList[index];
              return Dismissible(
                key: Key(question.title.toString()),
                background: const _DeleteContainer(),
                direction: DismissDirection.startToEnd,
                onDismissed: (direction) {
                  questionsStore.removeQuestion(
                    question,
                  );
                  showNotification(question);
                },
                child: ExpansionTile(
                  title: Text(question.title ?? ''),
                  children: [
                    Padding(
                      padding: const PagePadding.all(),
                      child: Column(
                        children: [
                          ListView.builder(
                            itemCount: question.answers.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder:
                                (BuildContext context, int answerIndex) {
                              return Column(
                                children: [
                                  ListTile(
                                    title: Text(
                                      question.answers[answerIndex].title ?? '',
                                    ),
                                    trailing: CustomTextButton(
                                      buttonTextStyle: const TextStyle(
                                        color: Color(0xFF4765ff),
                                      ),
                                      buttonText: ProductConstants.solve,
                                      onPressed: () async {
                                        await solveOnPressed(
                                          question,
                                          answerIndex,
                                        ).makeWithLoadingDialog(
                                          context: context,
                                        );
                                      },
                                    ),
                                  ),
                                  const Divider(),
                                ],
                              );
                            },
                          ),
                          CustomTextButton(
                            buttonTextStyle: const TextStyle(
                              color: Color(0xFF4765ff),
                            ),
                            buttonText: ProductConstants.addAnswer,
                            onPressed: () => context.router.push(
                              AddQARoute(
                                isQuestionPage: false,
                                question: question,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

final class _DeleteContainer extends StatelessWidget {
  const _DeleteContainer();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      alignment: Alignment.centerLeft,
      padding: const PagePadding.horizontalSymmetric(),
      child: const Icon(
        Icons.delete,
        color: Colors.white,
      ),
    );
  }
}
