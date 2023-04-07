
import 'package:labial/app/modules/question_module/data/model/question_model.dart';

abstract class QuestionDatasource{
  Future<List<QuestionModel>> getAll();
}