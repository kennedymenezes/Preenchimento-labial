import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:labial/app/domain/app/util/mappers/PatienteMapper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../domain/app/datasource/patient_datasource.dart';
import '../../../domain/app/model/patiente_model.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final PatientDatasource patientDatasource;
  HomeBloc({required this.patientDatasource}) : super(HomeState().init()) {
    on<InitEvent>(_init);
  }


  void _init(InitEvent event, Emitter<HomeState> emit) async {
    emit(HomeStateLoading());
    List<PatienteModel> patients=await patientDatasource.getAll();


    emit(HomeStateSuccess(patients));
  }
}
