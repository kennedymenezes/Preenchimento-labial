import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:labial/app/modules/question_module/bloc/question_bloc.dart';
import 'package:labial/app/modules/question_module/bloc/question_event.dart';

import '../../data/model/question_model.dart';

class MultipleQuestionWidget extends StatelessWidget {
  const MultipleQuestionWidget(
      {Key? key, required this.question, required this.bloc})
      : super(key: key);
  final QuestionModel question;
  final QuestionBloc bloc;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: question.options!.length,
        itemBuilder: (context, index) {
          return CheckboxListTile(
            checkColor: Colors.red,
            title: Text(
              question.options![index],
              style: Theme.of(context).textTheme.labelMedium,
            ),
            value:
                bloc.multiPleQuestionOption.contains(question.options![index]),
            onChanged: (bool? value) {
              if (value == true) {
                bloc.add(QuestionEventAddAnswerFromMultipleQuestion(
                    answer: question.options![index]));
              } else {
                bloc.add(QuestionEventRemoveAnswerFromOneQuestion(
                    answer: question.options![index], type: "multiple"));
              }
            },
          );
        });
  }
}
