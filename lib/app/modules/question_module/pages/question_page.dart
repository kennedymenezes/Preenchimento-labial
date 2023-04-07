import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:labial/app/domain/app/datasource/bd_helper.dart';
import 'package:labial/app/domain/app/routes/app_routes.dart';
import 'package:labial/app/domain/app/util/bd_key_constraints.dart';
import 'package:labial/app/modules/question_module/bloc/question_state.dart';
import 'package:labial/app/modules/question_module/data/model/question_model.dart';
import 'package:labial/app/modules/question_module/pages/widgets/multple_question_widget.dart';

import '../../../domain/app/widget/custom/cusom_button_ok_widget.dart';
import '../../../domain/app/widget/custom/custom_app_bar.dart';
import '../bloc/question_bloc.dart';
import '../bloc/question_event.dart';

class QuestionPage extends StatefulWidget {
  final QuestionBloc bloc;

  QuestionPage({super.key, required this.bloc});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  final PageController controller = PageController(
    viewportFraction: 1,
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => widget.bloc..add(InitEvent()),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final bloc = BlocProvider.of<QuestionBloc>(context);
    final size = MediaQuery.of(context).size;
    int pageG = 0;
    return Scaffold(
        appBar: CustomAppBar(size),
        body: BlocBuilder<QuestionBloc, QuestionState>(
          builder: (context, state) {
            if (state is QuestionStateLoading) {
              return const CircularProgressIndicator();
            }

            return PageView(
              onPageChanged: (page) {
                if (page >= 1) {
                  pageG = page - 1;
                }

                bloc.add(QuestionEventAddAnswerFromOneQuestion());
              },
              controller: controller,
              children: bloc.questions.map((question) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      question.title!,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(color: Theme.of(context).primaryColor),
                    ),
                    question.type == "multiple"
                        ? SizedBox(
                            height: size.height * 0.4,
                            child: MultipleQuestionWidget(
                              question: question,
                              bloc: bloc,
                            ),
                          )
                        : SizedBox(
                            height: size.height * 0.4,
                            child: Column(
                                children: question.options!.map((ansewer) {
                              return ListTile(
                                title: Text(
                                  ansewer,
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                ),
                                trailing: Radio<String>(
                                  value: ansewer,
                                  groupValue: bloc.singleQuestionOption[pageG],
                                  onChanged: (value) {
                                    bloc.singleQuestionOption[pageG] = value!;
                                    bloc.add(
                                        QuestionEventAddAnswerFromOneQuestion());
                                  },
                                ),
                              );
                            }).toList()),
                          ),
                    CustomButtonOkWidget(
                      onPressed: () async {
                        controller.nextPage(
                            duration: const Duration(microseconds: 1),
                            curve: Curves.linear);
                        if (pageG == 8) {
                          BdHelper.setData(
                              key: BdKeyConstraints.multipleAnswer,
                              data: jsonEncode(bloc.multiPleQuestionOption));
                          BdHelper.setData(
                              key: BdKeyConstraints.singleAnswer,
                              data: jsonEncode(bloc.singleQuestionOption));

                          Modular.to.pushNamed(AppRoutes.singature);
                        }
                      },
                      title: "OK",
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                );
              }).toList(),
            );
          },
        ));
  }
}
