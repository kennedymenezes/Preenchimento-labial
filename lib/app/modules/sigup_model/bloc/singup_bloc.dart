
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:labial/app/domain/app/model/patiente_model.dart';

import '../../../domain/app/datasource/patient_datasource.dart';
import '../../../domain/app/routes/app_routes.dart';
import 'singup_event.dart';
import 'singup_state.dart';

class SingupBloc extends Bloc<SingupEvent, SingupState> {
  final PatientDatasource patientDatasource;
  SingupBloc({required this.patientDatasource}) : super(SingupState().init()) {
    on<InitEvent>(_init);
    on<SingupEventSendData>(_createUser);
  }

String patientName="";
String patientPhoto="";
String patient1="";
String patient2="";

  void _init(InitEvent event, Emitter<SingupState> emit) async {

    emit(state.clone());


  }

  Future<void> _createUser(SingupEventSendData event, Emitter<SingupState> emit)async {
    List<Tratamento>? tratamento=[Tratamento(title: "pós-operatória imediata",idEntity: null,image: patientPhoto)];
    var patient=PatienteModel(nome: patientName,tratamento: tratamento);

    await patientDatasource.create(patiente: patient);
    Modular.to.pushNamed(AppRoutes.question);

  }
}
