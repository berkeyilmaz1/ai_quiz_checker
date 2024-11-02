import 'package:ai_quiz_checker/features/questions/questions_store.dart';
import 'package:ai_quiz_checker/features/questions/view/mixin/questions_view_mixin.dart';
import 'package:ai_quiz_checker/product/initialize/router/app_router.dart';
import 'package:ai_quiz_checker/product/utils/constants/product_constants.dart';
import 'package:ai_quiz_checker/product/widget/custom_elevated_button.dart';
import 'package:ai_quiz_checker/product/widget/page/page_padding.dart';
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
        title: const Text(ProductConstants.questionTitle),
      ),
      body: Observer(
        builder: (_) {
          if (questionsStore.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (questionsStore.questionList.isEmpty) {
            return CustomElevatedButton(
              buttonText: ProductConstants.addQuestion,
              onPressed: () =>
                  context.router.push(AddQARoute(isQuestionPage: true)),
            );
          }
          return ListView.builder(
            itemCount: questionsStore.questionList.length,
            itemBuilder: (context, index) {
              final question = questionsStore.questionList[index];
              return Dismissible(
                key: Key(question.title.toString()),
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerLeft,
                  padding: const PagePadding.horizontalSymmetric(),
                  child: const Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
                direction: DismissDirection.startToEnd,
                onDismissed: (direction) {
                  // Silme işlemi
                  questionsStore.removeQuestion(
                    question,
                  ); // Silme işlemi için gerekli fonksiyon
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${question.title} silindi'),
                    ),
                  );
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
                              return ListTile(
                                title: Text(
                                  question.answers[answerIndex].title ?? '',
                                ),
                                trailing: CustomElevatedButton(
                                  buttonText: ProductConstants.solve,
                                  onPressed: () => solveOnPressed(
                                    question,
                                    answerIndex,
                                  ),
                                ),
                              );
                            },
                          ),
                          CustomElevatedButton(
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
