import 'dart:math';

/// id : "00000000"
/// nome : "Emison"
/// tratamento : [{"id":"0000","image":"image","title":"title","description":"description"}]

class PatienteModel {
  PatienteModel({
       int? idEntity,
      this.nome, 
      this.tratamento,}){

    if(idEntity==null){
      id=_idGenerator();
    }else{
      id=idEntity;
    }
  }


  int? id;
  String? nome;
  List<Tratamento>? tratamento;



  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['nome'] = nome;
    if (tratamento != null) {
      map['tratamento'] = tratamento?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}
int _idGenerator() {
  int idGene= Random().nextInt(99999999);

  return idGene;
}
/// id : "0000"
/// image : "image"
/// title : "title"


class Tratamento {
  Tratamento({
   int? idEntity,
      this.image, 
      this.title, 
      }){

    if(idEntity==null){
      id=_idGenerator();
    }else{
      id=idEntity;
    }
  }

  Tratamento.fromJson(dynamic json) {
    id = json['id'];
    image = json['image'];
    title = json['title'];

  }
  int? id;
  String? image;
  String? title;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['image'] = image;
    map['title'] = title;

    return map;
  }

}