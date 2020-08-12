import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:uniphc/app/modules/atividades/models/atividades_model.dart';

class AtividadesRepository extends Disposable {
  final HasuraConnect _hasuraConnect;

  AtividadesRepository(this._hasuraConnect);

  Future<List<AtividadeModel>> getAtividade() async {
    var query = ''' 
      query getAtividades {
        tipo_atividades(order_by: {atividade_limite: desc}) {
          id
          atividade_nome
          atividade_peso
          atividade_limite
          atividade_medida
          atividade_peso_estatisticas
          curso {
            curso_hora_minima
          }
        }
      }''';
    var snapshot = await _hasuraConnect.query(query);

    return AtividadeModel.fromJsonList(
        snapshot["data"]["tipo_atividades"] as List);
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
