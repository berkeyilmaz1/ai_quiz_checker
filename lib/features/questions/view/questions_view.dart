import 'package:ai_quiz_checker/features/add_qa/view/add_qa_view.dart';
import 'package:ai_quiz_checker/features/questions/questions_store.dart';
import 'package:ai_quiz_checker/product/initialize/router/app_router.dart';
import 'package:ai_quiz_checker/product/utils/constants/product_constants.dart';
import 'package:ai_quiz_checker/product/widget/custom_elevated_button.dart';
import 'package:ai_quiz_checker/product/widget/page/page_padding.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

@RoutePage()
final class QuestionsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final questionsStore = Provider.of<QuestionsStore>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(ProductConstants.questionTitle),
        leading: IconButton(
            onPressed: () {
              context.router.push(AddQARoute());
            },
            icon: Icon(Icons.add)),
      ),
      body: Observer(
        builder: (_) {
          if (questionsStore.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (questionsStore.questionList.isEmpty) {
            return CustomElevatedButton(
              buttonText: ProductConstants.addQuestion,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => AddQAView()),
                );
              },
            );
          }
          return ListView.builder(
            itemCount: questionsStore.questionList.length,
            itemBuilder: (context, index) {
              final question = questionsStore.questionList[index];
              return ExpansionTile(
                title: Text(question.title ?? ''),
                children: [
                  Padding(
                    padding: PagePadding.all(),
                    child: question.answers == null || question.answers!.isEmpty
                        ? ElevatedButton(
                            onPressed: () {},
                            child: Text(ProductConstants.addAnswer))
                        : ListView.builder(
                            itemCount: question.answers?.length ?? 0,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder:
                                (BuildContext context, int answerIndex) {
                              return ListTile(
                                title: Text(
                                  question.answers?[answerIndex].title ?? '',
                                ),
                                trailing: IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {},
                                ),
                              );
                            },
                          ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
