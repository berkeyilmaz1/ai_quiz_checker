import 'package:ai_quiz_checker/features/questions/cubit/question_state.dart';
import 'package:ai_quiz_checker/features/questions/cubit/questions_cubit.dart';
import 'package:ai_quiz_checker/features/questions/view/mixin/question_view_mixin.dart';
import 'package:ai_quiz_checker/product/initialize/models/question.dart';
import 'package:ai_quiz_checker/product/utils/constants/product_constants.dart';
import 'package:ai_quiz_checker/product/widget/page/page_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class QuestionsView extends StatefulWidget {
  const QuestionsView({super.key});

  @override
  State<QuestionsView> createState() => _QuestionsViewState();
}

class _QuestionsViewState extends State<QuestionsView> with QuestionViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(ProductConstants.questionTitle),
        leading: IconButton(
          onPressed: () {
            questionCubit.addQuestion(
              Question(
                title: 'Question 1',
                id: 1,
                answers: [],
              ),
            );
          },
          icon: Icon(Icons.add),
        ),
      ),
      body: BlocProvider(
        create: (context) => questionCubit,
        child: Column(
          children: [
            BlocBuilder<QuestionsCubit, QuestionState>(
              builder: (context, state) {
                final questions = state.questionList;
                return Expanded(
                  child: ListView.builder(
                    itemCount: questions?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      if (questions == null) {
                        return CircularProgressIndicator();
                      }
                      return ExpansionTile(
                        title: Text(questions[index].title ?? ''),
                        trailing: customIcon
                            ? Icon(Icons.arrow_drop_down_rounded)
                            : Icon(Icons.arrow_drop_up_rounded),
                        onExpansionChanged: (value) {
                          setState(() {
                            customIcon = value;
                          });
                        },
                        children: [
                          Padding(
                            padding: PagePadding.all(),
                            child: questions[index].answers == null ||
                                    questions[index].answers!.isEmpty
                                ? ElevatedButton(
                                    onPressed: () {},
                                    child: Text(ProductConstants.addAnswer))
                                : ListView.builder(
                                    itemCount:
                                        questions[index].answers?.length ?? 0,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (BuildContext context,
                                        int answerIndex) {
                                      return ListTile(
                                        title: Text(
                                          questions[index]
                                                  .answers?[answerIndex]
                                                  .title ??
                                              '',
                                        ),
                                        trailing: IconButton(
                                          icon: Icon(Icons.delete),
                                          onPressed: () {
                                            questionCubit.removeQuestion(
                                              questions[index],
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  ),
                          ),
                        ],
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
