// To parse this JSON data, do
//
//     final atividadeModel = atividadeModelFromJson(jsonString);

import 'dart:convert';

AtividadeModel atividadeModelFromJson(String str) =>
    AtividadeModel.fromJson(json.decode(str));

String atividadeModelToJson(AtividadeModel data) => json.encode(data.toJson());

class AtividadeModel {
  AtividadeModel({
    this.id,
    this.atividadeNome,
    this.atividadePeso,
    this.atividadeLimite,
    this.atividadeMedida,
    this.atividadePesoEstatisticas,
    this.curso,
  });

  String id;
  String atividadeNome;
  String atividadePeso;
  int atividadeLimite;
  String atividadeMedida;
  double atividadePesoEstatisticas;
  Curso curso;

  factory AtividadeModel.fromJson(Map<String, dynamic> json) => AtividadeModel(
        id: json["id"],
        atividadeNome: json["atividade_nome"],
        atividadePeso: json["atividade_peso"],
        atividadeLimite: json["atividade_limite"],
        atividadeMedida: json["atividade_medida"],
        atividadePesoEstatisticas:
            json["atividade_peso_estatisticas"].toDouble(),
        curso: Curso.fromJson(json["curso"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "atividade_nome": atividadeNome,
        "atividade_peso": atividadePeso,
        "atividade_limite": atividadeLimite,
        "atividade_medida": atividadeMedida,
        "atividade_peso_estatisticas": atividadePesoEstatisticas,
        "curso": curso.toJson(),
      };

  static List<AtividadeModel> fromJsonList(List list) {
    if (list == null) return null;
    return list
        .map<AtividadeModel>((item) => AtividadeModel.fromJson(item))
        .toList();
  }
}

class Curso {
  Curso({
    this.cursoHoraMinima,
  });

  int cursoHoraMinima;

  factory Curso.fromJson(Map<String, dynamic> json) => Curso(
        cursoHoraMinima: json["curso_hora_minima"],
      );

  Map<String, dynamic> toJson() => {
        "curso_hora_minima": cursoHoraMinima,
      };
}
