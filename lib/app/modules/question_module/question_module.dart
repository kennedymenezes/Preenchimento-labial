

import 'package:flutter_modular/flutter_modular.dart';
import 'package:labial/app/modules/home_module/bloc/home_bloc.dart';
import 'package:labial/app/modules/home_module/pages/home_page.dart';
import 'package:labial/app/modules/question_module/bloc/question_bloc.dart';
import 'package:labial/app/modules/question_module/data/datasource/question_datasource_impl.dart';
import 'package:labial/app/modules/question_module/data/repository/question_repository_impl.dart';
import 'package:labial/app/modules/question_module/pages/question_page.dart';

class QuestionModule extends Module{

  List<Bind> get binds => [
    Bind.lazySingleton((i) => QuestionDatasourceImpl()),

    Bind.lazySingleton((i) => QuestionRepositoryImpl(datasource: i())),
    Bind.lazySingleton((i) => QuestionBloc(repository: i())),
  ];

  @override
  List<ModularRoute> get routes => [
  ChildRoute('/', child: (context, args) =>  QuestionPage(bloc:Modular.get<QuestionBloc>() )),


  ];

}