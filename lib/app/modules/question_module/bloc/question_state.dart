import 'package:labial/app/domain/app/model/patiente_model.dart';

class QuestionState {
  QuestionState init() {
    return QuestionState();
  }

  QuestionState clone() {
    return QuestionState();
  }
}
class QuestionStateLoading extends QuestionState{}
class QuestionStateSuccess extends QuestionState{

  final List<PatienteModel> data;

  QuestionStateSuccess(this.data);
}