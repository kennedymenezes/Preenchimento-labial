import 'dart:convert';

import 'package:labial/app/domain/app/datasource/bd_helper.dart';
import 'package:labial/app/domain/app/model/patiente_model.dart';
import 'package:labial/app/domain/app/util/bd_key_constraints.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../util/mappers/PatienteMapper.dart';
import 'patient_datasource.dart';

class PatientDataSourceImpl implements PatientDatasource {
  @override
  Future<PatienteModel> create({required PatienteModel patiente}) async {
    List<PatienteModel> patients = await getAll();
    patients.add(patiente);
    await BdHelper.setData(key: BdKeyConstraints.patienteData, data: jsonEncode(patients));
    return patiente;
  }

  @override
  Future<void> delete({required String id}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<PatienteModel>> getAll() async {
    String? data = await BdHelper.getData(key: BdKeyConstraints.patienteData);
    List localData = List.from(jsonDecode(data??"[]"));



    return localData.map((e) => PatienteMapper.fromJson(e)).toList();
  }

  @override
  Future<void> update(
      {required int id, required Tratamento tratamento}) async {
    List<PatienteModel> patients = await getAll();
    PatienteModel currentPatient=patients.firstWhere((element) => element.id==id);
    currentPatient.tratamento!.add(tratamento);
    patients.removeWhere((element) => element.id==id);
    patients.add(currentPatient);



    await BdHelper.setData(key: BdKeyConstraints.patienteData, data: jsonEncode(patients));

  }
}
