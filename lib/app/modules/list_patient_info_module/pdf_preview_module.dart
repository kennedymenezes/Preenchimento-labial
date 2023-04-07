import 'package:flutter_modular/flutter_modular.dart';
import 'package:labial/app/domain/app/datasource/patiente_datasource_Impl.dart';
import 'package:labial/app/modules/list_patient_info_module/bloc/list_patient_info_bloc.dart';
import 'package:labial/app/modules/list_patient_info_module/list_patient_Info_routes.dart';
import 'package:labial/app/modules/list_patient_info_module/page/list_patient_info_view.dart';

import 'page/patient_photo_page.dart';
import 'page/patient_photo_view_page.dart';

class ListPatientInfoModule extends Module {
  List<Bind> get binds => [

    Bind.lazySingleton((i) => PatientDataSourceImpl()),
    Bind.lazySingleton((i) => ListPatientInfoBloc(patientDatasource: i()))];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) => ListPatientInfoPage(
                  bloc: Modular.get<ListPatientInfoBloc>(),
                  patiente: args.data,
                ),),
    ChildRoute(
      ListPatientInfoRoutes.addPhoto,
      child: (context, args) => PatientPhotoPage(userId: args.data["userId"], title: args.data["title"],),
    ),
    ChildRoute(
      ListPatientInfoRoutes.okPhoto,
      child: (context, args) => PatientPhotoViewPage(
        imagePath: args.data["path"],
        title: args.data["title"],
      ),
    ),
      ];
}
