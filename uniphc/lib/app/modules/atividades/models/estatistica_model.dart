import 'dart:convert';

Estatistica estatisticaFromJson(String str) =>
    Estatistica.fromJson(json.decode(str));

String estatisticaToJson(Estatistica data) => json.encode(data.toJson());

class Estatistica {
  String id;
  String tipoAtividade;
  int limiteAtividade;
  double horaAtividade;

  Estatistica(
      {this.id, this.tipoAtividade, this.limiteAtividade, this.horaAtividade});

  factory Estatistica.fromJson(Map<String, dynamic> json) => Estatistica(
        id: json["id"],
        tipoAtividade: json["tipoAtividade"],
        limiteAtividade: json["limiteAtividade"],
        horaAtividade: json["horaAtividade"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tipoAtividade": tipoAtividade,
        "limiteAtividade": limiteAtividade,
        "horaAtividade": horaAtividade,
      };

  // @override
  // String toString() {
  //   return 'estatistica {id:$id, tipoAtividade:$tipoAtividade, limiteAtividade:$limiteAtividade, horaAtividade:$horaAtividade}';
  // }
}
