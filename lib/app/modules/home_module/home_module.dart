

import 'package:flutter_modular/flutter_modular.dart';
import 'package:labial/app/domain/app/datasource/patiente_datasource_Impl.dart';
import 'package:labial/app/modules/home_module/bloc/home_bloc.dart';
import 'package:labial/app/modules/home_module/pages/home_page.dart';

class HomeModule extends Module{

  List<Bind> get binds => [
    Bind.lazySingleton((i) => PatientDataSourceImpl()),
    Bind.lazySingleton((i) => HomeBloc(patientDatasource: i())),
  ];

  @override
  List<ModularRoute> get routes => [
  ChildRoute('/', child: (context, args) =>  HomePage(bloc:Modular.get<HomeBloc>() )),


  ];

}