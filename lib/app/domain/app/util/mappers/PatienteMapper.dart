

import '../../model/patiente_model.dart';

class PatienteMapper{

  static Map<String,dynamic> toJson(PatienteModel patient){

    return <String,dynamic>{


    };

  }
   static PatienteModel fromJson(Map<String,dynamic> map){

    Iterable allTrataments= map["tratamento"];
    return PatienteModel(idEntity: map["id"], nome:map["nome"],tratamento: allTrataments.map((e) => Tratamento.fromJson(e)).toList() );
  }

}