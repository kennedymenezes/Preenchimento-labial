import 'package:flutter_modular/flutter_modular.dart';
import 'package:labial/app/modules/list_patient_info_module/bloc/list_patient_info_bloc.dart';
import 'package:labial/app/modules/list_patient_info_module/page/list_patient_info_view.dart';



class ListPatientInfoModule extends Module {
  List<Bind> get binds => [
    Bind.lazySingleton((i) => ListPatientInfoBloc())
  ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) =>  ListPatientInfoPage(
              bloc:Modular.get<ListPatientInfoBloc>(),
              patiente: args.data,

                )),
      ];
}
