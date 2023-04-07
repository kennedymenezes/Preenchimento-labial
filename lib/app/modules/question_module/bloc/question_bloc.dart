import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:labial/app/domain/app/util/mappers/PatienteMapper.dart';
import 'package:labial/app/modules/question_module/data/model/question_model.dart';
import 'package:labial/app/modules/question_module/data/repository/question_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../domain/app/model/patiente_model.dart';
import 'question_event.dart';
import 'question_state.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  QuestionBloc({required this.repository}) : super(QuestionState().init()) {
    on<InitEvent>(_init);
    on<QuestionEventAddAnswerFromMultipleQuestion>(_addMultple);
    on<QuestionEventAddAnswerFromOneQuestion>(_addOne);
    on<QuestionEventRemoveAnswerFromOneQuestion>(
        _removeQuetionFromSelectedByString);
  }

  final QuestionRepository repository;
  List<QuestionModel> questions = [];
  final List<String> multiPleQuestionOption = [];
  final List<String> singleQuestionOption = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",


  ];

  void _init(InitEvent event, Emitter<QuestionState> emit) async {
    questions = await repository.getAll();
    emit(QuestionStateLoading());

    List<PatienteModel> patients = [];
    emit(QuestionStateSuccess(patients));
  }

  Future<void> _addMultple(QuestionEventAddAnswerFromMultipleQuestion event,
      Emitter<QuestionState> emit) async {
    multiPleQuestionOption.add(event.answer);
    emit(state.clone());
  }

  Future<void> _addOne(QuestionEventAddAnswerFromOneQuestion event,
      Emitter<QuestionState> emit) async {

    emit(state.clone());
  }

  Future<void> _removeQuetionFromSelectedByString(
      QuestionEventRemoveAnswerFromOneQuestion event,
      Emitter<QuestionState> emit) async {
    if (event.type == "multiple") {
      multiPleQuestionOption.removeWhere((element) => element == event.answer);
    } else {
      //  singleQuestionOption.removeWhere((element) => element==event.answer);
    }
    emit(state.clone());
  }
}
