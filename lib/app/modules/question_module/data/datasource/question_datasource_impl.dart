
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:labial/app/modules/question_module/data/datasource/question_datasource.dart';
import 'package:labial/app/modules/question_module/data/model/question_model.dart';
import 'package:labial/generated/assets.dart';

class QuestionDatasourceImpl implements QuestionDatasource{
  @override
  Future<List<QuestionModel>> getAll() async{
   List<QuestionModel> questions=[];
   var text=await rootBundle.loadString(Assets.assetsQuestions);
   var encoded=jsonDecode(text);
   Iterable allData=encoded["questions"];

   questions=allData.map((e) => QuestionModel.fromJson(e)).toList();


   return questions;

  }


}