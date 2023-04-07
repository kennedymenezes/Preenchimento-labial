import 'package:labial/app/modules/question_module/data/model/question_model.dart';

abstract class QuestionEvent {}

class InitEvent extends QuestionEvent {}
class QuestionEventAddAnswerFromMultipleQuestion extends QuestionEvent {
  final String answer;

  QuestionEventAddAnswerFromMultipleQuestion({required this.answer});

}
class QuestionEventAddAnswerFromOneQuestion extends QuestionEvent {


  QuestionEventAddAnswerFromOneQuestion();

}

class QuestionEventRemoveAnswerFromOneQuestion extends QuestionEvent {
  final String answer;
  final String type;

  QuestionEventRemoveAnswerFromOneQuestion({required this.answer ,required this.type});

}

