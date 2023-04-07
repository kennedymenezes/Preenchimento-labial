
import 'package:labial/app/modules/question_module/data/datasource/question_datasource.dart';
import 'package:labial/app/modules/question_module/data/model/question_model.dart';
import 'package:labial/app/modules/question_module/data/repository/question_repository.dart';

class QuestionRepositoryImpl implements QuestionRepository{
  final QuestionDatasource datasource;

  QuestionRepositoryImpl({required this.datasource});
  @override
  Future<List<QuestionModel>> getAll()async {

    return datasource.getAll();
  }
}