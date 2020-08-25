import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uniphc/app/database/dao/estatisticas_dao.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'hc.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(EstatisticaDao.tablesql);
    },
    version: 1,
  );
}
