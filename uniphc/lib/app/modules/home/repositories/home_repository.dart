import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:uniphc/app/modules/home/models/atividade_model.dart';

class HomeRepository extends Disposable {
  final HasuraConnect _hasuraConnect;

  HomeRepository(this._hasuraConnect);
  
  
  Future<List<AtividadeModel>> getAtividade() async{
    var query = '''
      query getAtividades {
        tipo_atividades {
          id
          atividade_nome
          atividade_peso
          atividade_limite
          curso {
            curso_hora_minima
          }
        }
      }''';
    var snapshot = await _hasuraConnect.query(query); 

        return AtividadeModel.fromJsonList(snapshot["data"]["tipo_atividades"] as List); 

  
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
