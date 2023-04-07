/// type : "multple"
/// id : 1
/// title : "1. Qual objetivo do paciente?"
/// options : ["a) volume","b) Hidratação","c) Contorn","d) Correção de Assimetria"]

class QuestionModel {
  QuestionModel({
      this.type, 
      this.id, 
      this.title, 
      this.options,});

  QuestionModel.fromJson(dynamic json) {
    type = json['type'];
    id = json['id'];
    title = json['title'];
    options = json['options'] != null ? json['options'].cast<String>() : [];
  }
  String? type;
  int? id;
  String? title;
  List<String>? options;
QuestionModel copyWith({  String? type,
  int? id,
  String? title,
  List<String>? options,
}) => QuestionModel(  type: type ?? this.type,
  id: id ?? this.id,
  title: title ?? this.title,
  options: options ?? this.options,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['id'] = id;
    map['title'] = title;
    map['options'] = options;
    return map;
  }

}