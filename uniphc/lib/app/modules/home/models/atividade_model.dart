// To parse this JSON data, do
//
//     final atividadeModel = atividadeModelFromJson(jsonString);

import 'dart:convert';

AtividadeModel atividadeModelFromJson(String str) => AtividadeModel.fromJson(json.decode(str));

String atividadeModelToJson(AtividadeModel data) => json.encode(data.toJson());

class AtividadeModel {
    AtividadeModel({
        this.id,
        this.cursoNome,
        this.cursoHoraMinima,
        this.tipoAtividades,
    });

    String id;
    String cursoNome;
    int cursoHoraMinima;
    List<TipoAtividade> tipoAtividades;

    factory AtividadeModel.fromJson(Map<String, dynamic> json) => AtividadeModel(
        id: json["id"],
        cursoNome: json["curso_nome"],
        cursoHoraMinima: json["curso_hora_minima"],
        tipoAtividades: List<TipoAtividade>.from(json["tipo_atividades"].map((x) => TipoAtividade.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "curso_nome": cursoNome,
        "curso_hora_minima": cursoHoraMinima,
        "tipo_atividades": List<dynamic>.from(tipoAtividades.map((x) => x.toJson())),
    };

  static List<AtividadeModel> fromJsonList(List list) {  
  if ( list == null ) return null;
  return list
    .map<AtividadeModel>((item) => AtividadeModel.fromJson(item))
    .toList();

  }
}

class TipoAtividade {
    TipoAtividade({
        this.atividade,
        this.limiteAtividade,
        this.pesoAtividade,
    });

    Atividade atividade;
    int limiteAtividade;
    String pesoAtividade;

    factory TipoAtividade.fromJson(Map<String, dynamic> json) => TipoAtividade(
        atividade: Atividade.fromJson(json["atividade"]),
        limiteAtividade: json["limite_atividade"],
        pesoAtividade: json["peso_atividade"],
    );

    Map<String, dynamic> toJson() => {
        "atividade": atividade.toJson(),
        "limite_atividade": limiteAtividade,
        "peso_atividade": pesoAtividade,
    };
}

class Atividade {
    Atividade({
        this.atividadeNome,
    });

    String atividadeNome;

    factory Atividade.fromJson(Map<String, dynamic> json) => Atividade(
        atividadeNome: json["atividade_nome"],
    );

    Map<String, dynamic> toJson() => {
        "atividade_nome": atividadeNome,
    };
}
