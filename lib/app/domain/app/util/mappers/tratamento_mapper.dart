import '../../model/patiente_model.dart';

class TratamenteMapper {
  static Map<String, dynamic> toJson(PatienteModel patient) {
    return <String, dynamic>{};
  }

  static Tratamento fromJson(Map<String, dynamic> map) {
    return Tratamento(
      idEntity: map["id"],
      image: map['image'],
      title: map['title'],
    );
  }
}
