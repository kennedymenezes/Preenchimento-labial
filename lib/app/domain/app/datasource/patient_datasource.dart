
import 'package:labial/app/domain/app/model/patiente_model.dart';

abstract class PatientDatasource{

  Future<List<PatienteModel>> getAll();
  Future<void> create({required PatienteModel patiente});
  Future<void> update({required String id, required PatienteModel patient});
  Future<void> delete({required String id});

}