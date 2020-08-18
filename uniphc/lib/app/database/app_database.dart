import 'dart:async';

import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'hc.db');
  return openDatabase(path, onCreate: (db, version) {
    db.execute('CREATE TABLE estatisticas('
        'id INTEGER PRIMARY KEY,'
        'tipoAtividade TEXT,'
        'limiteAtividade INTEGER,'
        'horaAtividade NUMERIC');
  }, version: 1);
}

void save(Estatistica estatistica) {
  createDatabase().then((db) {
    final Map<String, dynamic> estatisticasMap = Map();
    contactMap['id'] = estatistica.id;
    db.insert('estatisticas', values);
  });
}
