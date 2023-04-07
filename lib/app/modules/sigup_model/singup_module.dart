import 'package:flutter_modular/flutter_modular.dart';
import 'package:labial/app/domain/app/datasource/patiente_datasource_Impl.dart';
import 'package:labial/app/modules/home_module/bloc/home_bloc.dart';
import 'package:labial/app/modules/sigup_model/SingupRoutes.dart';
import 'package:labial/app/modules/sigup_model/bloc/singup_bloc.dart';

import 'pages/patient_photo_page.dart';
import 'pages/patient_photo_view_page.dart';
import 'pages/singup_page.dart';

class SingupModule extends Module {
  List<Bind> get binds => [
    Bind.lazySingleton((i) => PatientDataSourceImpl()),
        Bind.lazySingleton((i) => SingupBloc(patientDatasource: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => SigupPage(bloc: Modular.get<SingupBloc>()),
        ),
        ChildRoute(
          SingupRoutes.addPhoto,
          child: (context, args) => PatientPhotoPage(),
        ),
        ChildRoute(
          SingupRoutes.okPhoto,
          child: (context, args) => PatientPhotoViewPage(
            imagePath: args.data["path"],
            title: args.data["title"],
          ),
        ),
      ];
}
