import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqflite_dev.dart';
import 'package:uniphc/app/modules/atividades/models/estatistica_model.dart';

// Future<Database> getDatabase() async {
//   final String path = join(await getDatabasesPath(), 'hc.db');
//   return openDatabase(
//     path,
//     onCreate: (db, version) {
//       db.execute(EstatisticaDao.tablesql);
//     },
//     version: 1,
//   );
// }

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();
    return _database;
  }

  initDB() async {
    return await openDatabase(join(await getDatabasesPath(), 'horac.db'),
        onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE estatistica (
          id TEXT PRIMARY KEY,
          tipoAtividade TEXT,
          limiteAtividade INTEGER,
          horaAtividade INTEGER
        )
      ''');
    }, version: 1);
  }

  newEstatistica(Estatistica newEstatistica) async {
    final db = await database;

    var res = await db.rawInsert('''
      INSERT INTO estatistica (
        id, tipoAtividade, limiteAtividade, horaAtividade
      ) VALUE (?, ?, ?, ?)
    ''', [
      newEstatistica.id,
      newEstatistica.tipoAtividade,
      newEstatistica.limiteAtividade,
      newEstatistica.horaAtividade
    ]);
    return res;
  }

  Future<dynamic> getAtividade() async {
    final db = await database;
    var res = await db.query("estatistica");
    if (res.length == 0) {
      return null;
    } else {
      var resMap = res[0];
      return resMap.isNotEmpty ? resMap : Null;
    }
  }
}
