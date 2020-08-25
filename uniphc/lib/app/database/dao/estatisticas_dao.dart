import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:uniphc/app/database/app_database.dart';
import 'package:uniphc/app/modules/atividades/models/estatistica_model.dart';

class EstatisticaDao {
  static const String tablesql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY,'
      '$_tipoAtividade TEXT,'
      '$_limiteAtividade INTEGER,'
      '$_horaAtividade NUMERIC';
  static const String _tableName = 'estatistica';
  static const String _id = 'id';
  static const String _tipoAtividade = 'tipoAtividade';
  static const String _limiteAtividade = 'limiteAtividade';
  static const String _horaAtividade = 'horaAtividade';

  Future<int> save(Estatistica estatistica) async {
    final Database db = await getDatabase();
    Map<String, dynamic> estatisticaMap = _toMap(estatistica);
    return db.insert(_tableName, estatisticaMap);
  }

  Future<List<Estatistica>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    List<Estatistica> estatisticas = _toList(result);
    return estatisticas;
  }

  Map<String, dynamic> _toMap(Estatistica estatistica) {
    final Map<String, dynamic> estatisticaMap = Map();
    estatisticaMap[_tipoAtividade] = estatistica.tipoAtividade;
    estatisticaMap[_limiteAtividade] = estatistica.limiteAtividade;
    estatisticaMap[_horaAtividade] = estatistica.horaAtividade;
    return estatisticaMap;
  }

  List<Estatistica> _toList(List<Map<String, dynamic>> result) {
    final List<Estatistica> estatisticas = List();
    for (Map<String, dynamic> row in result) {
      final Estatistica estatistica = Estatistica(
        row[_id],
        row[_tipoAtividade],
        row[_limiteAtividade],
        row[_horaAtividade],
      );
      estatisticas.add(estatistica);
    }
    return estatisticas;
  }
}
