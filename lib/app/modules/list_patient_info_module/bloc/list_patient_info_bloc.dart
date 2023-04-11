import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:labial/app/domain/app/model/patiente_model.dart';
import 'package:labial/app/domain/app/routes/app_routes.dart';

import '../../../domain/app/datasource/patient_datasource.dart';
import 'list_patient_info_event.dart';
import 'list_patient_info_state.dart';

class ListPatientInfoBloc extends Bloc<ListPatientInfoEvent, ListPatientInfoState> {
  ListPatientInfoBloc({required this.patientDatasource}) : super(ListPatientInfoState().init()) {
    on<InitEvent>(_init);
    on<ListPatientInfoEventSendData>(_sendData);
  }
  final PatientDatasource patientDatasource;

  String patientPhoto="";
  int userId=0;
  String title="";
  void _init(InitEvent event, Emitter<ListPatientInfoState> emit) async {
    emit(state.clone());
  }

  Future<void> _sendData(ListPatientInfoEventSendData event, Emitter<ListPatientInfoState> emit) async{
    var tratamento=Tratamento(image: patientPhoto,title: title);
    await patientDatasource.update(id: userId, tratamento: tratamento);
    Modular.to.pushNamed(AppRoutes.home);
  }
}
