


import '../model/question_model.dart';

abstract class QuestionRepository{
  Future<List<QuestionModel>> getAll();
}